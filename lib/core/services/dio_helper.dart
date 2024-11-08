import 'dart:developer';

import 'package:dio/dio.dart';

import '../constants/end_points.dart';

class DioHelper {
  final Dio _dio = Dio();

  Future<Response<Map<String, dynamic>?>> uploadImage(dynamic data) async {
    final Response<Map<String, dynamic>?> response = await _dio.post(
        EndPoints.colorizeImageEndpoint,
        data: data,
        onSendProgress: (count, total) {
          log("On Send");
          log(count.toString());
          log(total.toString());
        },
        onReceiveProgress: (count, total) {
          log("On Receive");
          log(count.toString());
          log(total.toString());
        },
        options: Options(
          headers: {
            "X-API-KEY": EndPoints.apiKey,
            "quality" : 100
          }
        )
    );

   return response;
 }

}