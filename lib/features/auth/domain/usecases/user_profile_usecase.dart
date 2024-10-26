import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';
import 'package:selaty/features/auth/domain/repos/auth_repo.dart';

class UserProfileUsecase extends UseCase<UserProfileEntity, dynamic> {
  @override
  Future<UserProfileEntity> call({param}) async {
    return await sl<AuthRepo>().getUserProfile();
  }
}
