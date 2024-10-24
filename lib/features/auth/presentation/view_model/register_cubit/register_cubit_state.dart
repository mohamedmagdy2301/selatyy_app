part of 'register_cubit_cubit.dart';

class RegisterCubitState {}

final class RegisterCubitInitial extends RegisterCubitState {}

final class RegisterCubitLoading extends RegisterCubitState {}

final class RegisterCubitSuccess extends RegisterCubitState {}

final class RegisterCubitFailure extends RegisterCubitState {
  final String errorMassage;

  RegisterCubitFailure(this.errorMassage);
}
