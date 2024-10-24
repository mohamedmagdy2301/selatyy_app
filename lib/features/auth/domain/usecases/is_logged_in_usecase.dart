import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class IsLoggedInUsecase extends UseCase<bool, dynamic> {
  @override
  Future<bool> call({param}) async {
    return await sl<AuthRepo>().isLoggedIn();
  }
}
