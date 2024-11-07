import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/errors/failure.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/data/source/auth_api_service.dart';
import 'package:selaty/features/auth/data/source/auth_loacl_service.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class AuthReposImpl implements AuthRepo {
  @override
  Future<Either<String, RegisterData>> register(
      RegisterRequest registerReqPram) async {
    try {
      var result = await sl<AuthApiService>().register(registerReqPram);
      return result.fold(
        (error) => left(error),
        (data) {
          // saveUerInfo(data);
          return right(data);
        },
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e).message);
    } catch (e) {
      return left("حدث خطأ غير متوقع$e");
    }
  }

  @override
  Future<Either<String, LoginData>> login(LoginRequest loginReqParm) async {
    try {
      var result = await sl<AuthApiService>().login(loginReqParm);
      return result.fold(
        (error) => left(error),
        (data) {
          saveUerInfo(data);
          return right(data);
        },
      );
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e).message);
    } catch (e) {
      return left("حدث خطأ غير متوقع$e");
    }
  }

  @override
  Future<bool> isLoggedIn() async {
    return await sl<AuthLocalService>().isLoggedIn();
  }

  @override
  Future<UserProfileEntity> getUserProfile() async {
    return await sl<AuthLocalService>().userProfile();
  }

  @override
  Future<String> updateUserProfile(model) async {
    try {
      String data = await sl<AuthApiService>().updateUserProfile(model);
      return data;
    } on DioException catch (e) {
      return ServerFailure.fromDioException(e).message;
    } catch (e) {
      return "حدث خطأ غير متوقع$e";
    }
  }

  void saveUerInfo(LoginData data) {
    SharedPreferencesManager.setData(
      key: tokenKey,
      value: data.token,
    );
    SharedPreferencesManager.setData(
      key: nameKey,
      value: data.name,
    );
    SharedPreferencesManager.setData(
      key: addressKey,
      value: data.address,
    );
    SharedPreferencesManager.setData(
      key: phoneKey,
      value: data.mobile,
    );

    SharedPreferencesManager.setData(
      key: emailKey,
      value: data.email,
    );
    SharedPreferencesManager.setData(
      key: imageKey,
      value: data.profilePhotoPath,
    );
  }
}
