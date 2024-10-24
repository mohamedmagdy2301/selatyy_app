import 'package:bloc/bloc.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/domain/usecases/is_logged_in_usecase.dart';

part 'is_logged_in_state.dart';

class IsLoggedInCubit extends Cubit<IsLoggedInState> {
  IsLoggedInCubit() : super(UnAuthenticatedState());

  isLoggedIn() async {
    bool isAuthenticated = await sl<IsLoggedInUsecase>().call();
    if (isAuthenticated) {
      emit(AuthenticatedState());
    } else {
      emit(UnAuthenticatedState());
    }
  }
}
