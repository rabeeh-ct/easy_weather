import '../data/core/api_client.dart';
import '../data/data_sources/remote_data_source.dart';
import '../data/repository/data_repository_impl.dart';
import '../domain/repository/data_repository.dart';
import '../domain/usecases/change_locale.dart';
import '../domain/usecases/get_current_weather_usecase.dart';
import '../domain/usecases/location_lat_lng_usecase.dart';
import '../domain/usecases/theme_mode_save_usecase.dart';
import '../presentation/screens/home_screen/home_screen_controller.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
class DependencyInjection {
  static init() {
    getIt.registerLazySingleton(() => HomeScreenController());
    getIt.registerLazySingleton(() => ApiClient());
    // getIt.registerLazySingleton<AuthenticationRepository>(() => AuthenticationRepositoryImpl());
    // getIt.registerLazySingleton<AuthenticationRemoteDataSource>(() => AuthenticationRemoteDataSourceImpl(),
    //     fenix: true);
    // getIt.registerLazySingleton<AuthenticationLocalDataSource>(() => AuthenticationLocalDataSourceImpl(),
    //     fenix: true);
    getIt.registerLazySingleton<DataRepository>(() => DataRepositoryImpl());
    getIt.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
    // getIt.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());
    // getIt.registerLazySingleton<UserPreferencesRepository>(() => UserPreferenceRepositoryImpl());
    // getIt.registerLazySingleton<UserPreferenceLocalDataSource>(() => UserPreferenceLocalDataSourceImpl(),
    //     fenix: true);
    getIt.registerLazySingleton(() => ChangeLocale());
    getIt.registerLazySingleton(() => GetCurrentWeatherUseCase());
    getIt.registerLazySingleton(() => LocationLatLngUseCase());

  }
}
