part of 'view_user_profile_cubit.dart';

class ViewUserProfileState {}

final class ViewUserProfileIntiliz extends ViewUserProfileState {}

final class ViewUserProfileDone extends ViewUserProfileState {
  final UserProfileEntity userProfileInfo;

  ViewUserProfileDone({required this.userProfileInfo});
}
