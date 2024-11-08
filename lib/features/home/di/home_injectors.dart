import 'package:colorize_image_app_clean_arch_flutter/features/home/data/data_sources/colorize_image_datasource.dart';
import '../../../core/di/injector_config.dart';
import '../data/models/repositories/colorize_image_repository_impl.dart';
import '../domin/repositories/colorize_image_repository.dart';
import '../domin/use_cases/get_colorized_image_usecase.dart';

class HomeDi{
  HomeDi._();

  static void initialize(){
    //data sources
    injector.registerLazySingleton(() => ColorizeImageDataSource(injector()));
    
    //repositories
    injector.registerLazySingleton<ColorizeImageRepository>(() => ColorizeImageRepositoryImpl(injector()));

    //use case
    injector.registerFactory(() => GetColorizedImageUseCase(injector()));

  }

}
