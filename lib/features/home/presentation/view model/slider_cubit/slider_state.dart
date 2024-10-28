part of 'slider_cubit.dart';

class SliderState {}

final class SliderInitial extends SliderState {}

final class SliderLoading extends SliderState {}

final class SliderSuccess extends SliderState {
  final List<SliderEntity> sliders;
  SliderSuccess(this.sliders);
}

final class SliderFailure extends SliderState {
  final String message;
  SliderFailure(this.message);
}
