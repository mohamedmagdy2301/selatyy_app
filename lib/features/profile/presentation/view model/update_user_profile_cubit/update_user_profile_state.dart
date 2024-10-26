part of 'update_user_profile_cubit.dart';

class UpdateUserProfileState {}

final class UpdateUserProfileInitial extends UpdateUserProfileState {}

final class UpdateUserProfileLoading extends UpdateUserProfileState {}

final class UpdateUserProfileSuccess extends UpdateUserProfileState {
  final String message;

  UpdateUserProfileSuccess({required this.message});
}

final class UpdateUserProfileFailure extends UpdateUserProfileState {
  final String message;

  UpdateUserProfileFailure({required this.message});
}
