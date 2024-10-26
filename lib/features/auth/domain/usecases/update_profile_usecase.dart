import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/data/models/update_user_model/update_profile_request.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class UpdateProfileUsecase extends UseCase<String, UpdateProfileRequest> {
  @override
  Future<String> call({UpdateProfileRequest? param}) async {
    return await sl<AuthRepo>().updateUserProfile(param!);
  }
}
