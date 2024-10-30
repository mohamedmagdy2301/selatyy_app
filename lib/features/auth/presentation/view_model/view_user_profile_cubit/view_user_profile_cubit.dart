import 'package:bloc/bloc.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';
import 'package:selaty/features/auth/domain/usecases/user_profile_usecase.dart';

part 'view_user_profile_state.dart';

class ViewUserProfileCubit extends Cubit<ViewUserProfileState> {
  ViewUserProfileCubit() : super(ViewUserProfileIntiliz());
  viewUserProfile() async {
    UserProfileEntity userProfileInfo = await sl<UserProfileUsecase>().call();
    emit(ViewUserProfileDone(userProfileInfo: userProfileInfo));
  }
}
