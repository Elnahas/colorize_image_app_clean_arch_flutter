import 'dart:developer';

import '../di/injector_config.dart';
import '../services/network_checker.dart';
import 'failures.dart';

  Future<void> failuresHandler(
    Function() task, {
      required Function(Failure failure) onError,
      bool ignoreNetworkCheck = false,
   }) async{

    if(!ignoreNetworkCheck){
      if(!(await injector<NetworkChecker>().hasConnection)){
        onError(const NoInternetFailure());
        return;
      }
    }

    try {
      await task();
    } catch (e,s) {
      log(e.toString(),stackTrace: s);
      if(e is Failure){
        onError(e);
      }else{
        onError(const UnExpectedFailure("something went wrong, please try again later"));
      }
  }
}