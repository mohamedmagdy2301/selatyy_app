import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/domain/usecases/login_usecase.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  login({required LoginRequest param}) async {
    emit(LoginLoading());
    Future.delayed(Duration(seconds: 2), () async {
      Either<String, LoginData> result =
          await sl<LoginUsecase>().call(param: param);
      result.fold(
        (failure) => emit(LoginFailure(failure)),
        (success) => emit(LoginSuccess()),
      );
    });
  }
}
