import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/data/models/register_model/register_response.dart';
import 'package:selaty/features/auth/domain/usecases/register_usecase.dart';

part 'register_cubit_state.dart';

class RegisterCubit extends Cubit<RegisterCubitState> {
  RegisterCubit() : super(RegisterCubitInitial());

  register({required RegisterRequest registerRequest}) async {
    emit(RegisterCubitLoading());
    Either<String, RegisterData> result =
        await sl<RegisterUsecase>().call(param: registerRequest);
    result.fold(
      (error) => emit(RegisterCubitFailure(error)),
      (data) => emit(RegisterCubitSuccess()),
    );
  }
}
