import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
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
      (result) {
        // if (result.status) {
        //   log(result.data!.toString());
        //   return right(result.data!);
        // }
        log(result.toString());

        return right(result);
      },
    );
  }
}
