import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class RegisterUsecase
    implements UseCase<Either<String, RegisterData>, RegisterRequest> {
  @override
  Future<Either<String, RegisterData>> call({RegisterRequest? param}) async {
    Either<String, RegisterData> result = await sl<AuthRepo>().register(param!);
    return result.fold(
      (error) => left(error),
      (data) => right(data),
    );
  }
}
