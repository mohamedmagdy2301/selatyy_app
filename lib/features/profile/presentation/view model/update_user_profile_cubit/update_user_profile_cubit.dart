import 'package:bloc/bloc.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/domain/usecases/update_profile_usecase.dart';

part 'update_user_profile_state.dart';

class UpdateUserProfileCubit extends Cubit<UpdateUserProfileState> {
  UpdateUserProfileCubit() : super(UpdateUserProfileInitial());

  updateUserProfile({param}) async {
    emit(UpdateUserProfileLoading());
    Future.delayed(Duration(seconds: 2), () async {
      String message = await sl<UpdateProfileUsecase>().call(param: param);
      if (message == "تم التعديل بنجاح ") {
        emit(UpdateUserProfileSuccess(message: message));
      } else {
        emit(UpdateUserProfileFailure(message: message));
      }
    });
  }
}
