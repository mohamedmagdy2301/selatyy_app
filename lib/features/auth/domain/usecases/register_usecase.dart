import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase implements UseCase<Either, RegisterRequest> {
  @override
  Future<Either> call({RegisterRequest? param}) async {
    return await sl<AuthRepo>().register(param!);
  }
}
