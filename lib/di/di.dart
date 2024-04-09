import '../data/core/api_client.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/data_repository.dart';
import '../domain/usecases/get_current_weather_usecase.dart';
import '../domain/usecases/location_lat_lng_usecase.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
class DependencyInjection {
  static init() {
    getIt.registerLazySingleton(() => ApiClient());
    getIt.registerLazySingleton<DataRepository>(() => DataRepositoryImpl());
    getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
    getIt.registerLazySingleton(() => GetCurrentWeatherUseCase());
    getIt.registerLazySingleton(() => LocationLatLngUseCase());

  }
}
