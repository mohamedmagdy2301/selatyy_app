import 'package:get_it/get_it.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/features/auth/data/repos/auth_repos_impl.dart';
import 'package:selaty/features/auth/data/source/auth_api_service.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';
import 'package:selaty/features/auth/domain/usecases/register_usecase.dart';

final sl = GetIt.instance;

void setupServiceLocator() {
  sl.registerSingleton<DioApiService>(DioApiService());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepo>(AuthReposImpl());

  // Usecases
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase());
}
