import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';

abstract class AuthApiService {
  Future<Either<String, RegisterData>> register(RegisterRequest model);
  Future<Either<String, LoginData>> login(LoginRequest model);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<String, RegisterData>> register(RegisterRequest model) async {
    try {
      Response<dynamic> response = await sl<DioApiService>().post(
        ApiUrls.registerUrl,
        data: model.toJson(),
      );
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      if (registerResponse.status) {
        return right(registerResponse.data!);
      }
      return left(registerResponse.errorMessage!);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, LoginData>> login(LoginRequest model) async {
    Response<dynamic> result = await sl<DioApiService>().post(
      ApiUrls.loginUrl,
      data: model.toJson(),
    );
    LoginResponse loginResponse = LoginResponse.fromJson(result.data);
    if (loginResponse.status!) {
      return right(loginResponse.data!);
    }
    return left(loginResponse.message!);
  }
}
