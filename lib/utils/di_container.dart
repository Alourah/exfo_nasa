import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:nasa_workshop/data/repository/apod_service_impl.dart';
import 'package:nasa_workshop/domain/repository/apod_service.dart';
import 'package:nasa_workshop/domain/usecases/fetch_apod_usecase.dart';
import 'package:nasa_workshop/utils/network_info.dart';

final GetIt getIt = GetIt.instance;

void setupDependencyInjection() {
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<NetworkInfo>(NetworkInfoImpl());
  getIt.registerSingleton<ApodService>(ApodServiceImpl(getIt<Dio>(), getIt<NetworkInfo>()));
  getIt.registerSingleton<FetchApodUseCase>(FetchApodUseCase(getIt<ApodService>()));
}
