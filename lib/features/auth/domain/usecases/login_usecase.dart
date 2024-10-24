import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class LoginUsecase extends UseCase<Either, LoginRequest> {
  @override
  Future<Either<String, LoginData>> call({LoginRequest? param}) async {
    Either<String, LoginData> result = await sl<AuthRepo>().login(param!);
    return result.fold(
      (error) => left(error),
      (data) => right(data),
    );
  }
}
