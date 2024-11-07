import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/data/models/update_user_model/update_profile_request.dart';

abstract class AuthApiService {
  Future<Either<String, RegisterData>> register(RegisterRequest model);
  Future<Either<String, LoginData>> login(LoginRequest model);
  Future<String> updateUserProfile(UpdateProfileRequest model);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<String, RegisterData>> register(RegisterRequest model) async {
    Response<dynamic> response = await sl<DioApiService>().post(
      ApiUrls.registerUrl,
      data: FormData.fromMap(
        await model.toJson(),
      ),
    );
    RegisterResponse registerResponse =
        RegisterResponse.fromJson(response.data);
    if (registerResponse.status) {
      return right(registerResponse.data!);
    }
    return left(registerResponse.errorMessage!);
  }

  @override
  Future<Either<String, LoginData>> login(LoginRequest model) async {
    Response<dynamic> response = await sl<DioApiService>().post(
      ApiUrls.loginUrl,
      data: model.toJson(),
    );
    LoginResponse loginResponse = LoginResponse.fromJson(response.data);
    if (loginResponse.status!) {
      return right(loginResponse.data!);
    }
    return left(loginResponse.message!);
  }

  @override
  Future<String> updateUserProfile(UpdateProfileRequest model) async {
    Response response = await sl<DioApiService>().post(
      ApiUrls.updateProfileUrl,
      data: FormData.fromMap(
        await model.toJson(),
      ),
      options: Options(
        headers: {
          'Authorization':
              "Bearer ${SharedPreferencesManager.getData(key: tokenKey)}",
        },
      ),
    );
    return response.data['message'];
  }
}
