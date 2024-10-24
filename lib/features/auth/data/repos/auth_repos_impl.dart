import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/data/source/auth_api_service.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class AuthReposImpl implements AuthRepo {
  @override
  Future<Either<String, RegisterResponse>> register(
      RegisterRequest registerReqPram) async {
    Either<String, RegisterResponse> result =
        await sl<AuthApiService>().register(registerReqPram);
    return result.fold(
      (error) => left(error),
      (result) => right(result),
    );
  }

  @override
  Future<Either<String, LoginData>> login(LoginRequest loginReqParm) async {
    Either<String, LoginData> result =
        await sl<AuthApiService>().login(loginReqParm);
    return result.fold(
      (error) => left(error),
      (data) => right(data),
      // Todo: save token in local
    );
  }
}
