import 'package:get_it/get_it.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/features/auth/data/repos/auth_repos_impl.dart';
import 'package:selaty/features/auth/data/source/auth_api_service.dart';
import 'package:selaty/features/auth/data/source/auth_loacl_service.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';
import 'package:selaty/features/auth/domain/usecases/is_logged_in_usecase.dart';
import 'package:selaty/features/auth/domain/usecases/login_usecase.dart';
import 'package:selaty/features/auth/domain/usecases/register_usecase.dart';
import 'package:selaty/features/auth/domain/usecases/update_profile_usecase.dart';
import 'package:selaty/features/auth/domain/usecases/user_profile_usecase.dart';

GetIt sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<DioApiService>(DioApiService());

  // Services
  sl.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  sl.registerSingleton<AuthLoaclService>(AuthLoaclServiceImpl());

  // Repositories
  sl.registerSingleton<AuthRepo>(AuthReposImpl());

  // Usecases
  sl.registerSingleton<RegisterUsecase>(RegisterUsecase());
  sl.registerSingleton<LoginUsecase>(LoginUsecase());
  sl.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  sl.registerSingleton<UserProfileUsecase>(UserProfileUsecase());
  sl.registerSingleton<UpdateProfileUsecase>(UpdateProfileUsecase());
}
