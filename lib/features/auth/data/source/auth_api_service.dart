import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';

abstract class AuthApiService {
  Future<Either<String, RegisterResponse>> register(RegisterRequest model);
}

class AuthApiServiceImpl implements AuthApiService {
  @override
  Future<Either<String, RegisterResponse>> register(
      RegisterRequest model) async {
    try {
      Response<dynamic> response = await sl<DioApiService>().post(
        ApiUrls.registerUrl,
        data: model.toJson(),
      );
      RegisterResponse registerResponse =
          RegisterResponse.fromJson(response.data);
      return right(registerResponse);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      return left(e.toString());
    }
  }
}
