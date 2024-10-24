import 'package:dartz/dartz.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/data/source/auth_api_service.dart';
import 'package:selaty/features/auth/data/source/auth_loacl_service.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class AuthReposImpl implements AuthRepo {
  @override
  Future<Either<String, RegisterData>> register(
      RegisterRequest registerReqPram) async {
    Either<String, RegisterData> result =
        await sl<AuthApiService>().register(registerReqPram);
    return result.fold(
      (error) => left(error),
      (result) {
        // Todo: save token in locals
        SharedPreferencesManager.setData(key: registerDataKey, value: result);
        SharedPreferencesManager.setData(key: tokenKey, value: tokenKey);
        return right(result);
      },
    );
  }

  @override
  Future<Either<String, LoginData>> login(LoginRequest loginReqParm) async {
    Either<String, LoginData> result =
        await sl<AuthApiService>().login(loginReqParm);
    return result.fold(
      (error) => left(error),
      (data) {
        SharedPreferencesManager.setData(key: loginDataKey, value: data);
        SharedPreferencesManager.setData(key: tokenKey, value: tokenKey);

        return right(data);
      },
    );
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLoaclService>().isLoggedIn();
  }
}
