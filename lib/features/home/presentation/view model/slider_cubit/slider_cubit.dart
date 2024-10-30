import 'package:bloc/bloc.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:selaty/features/home/domain/usecases/view_slider_usecase.dart';

part 'slider_state.dart';

class SliderCubit extends Cubit<SliderState> {
  SliderCubit() : super(SliderInitial());

  getSlider() async {
    emit(SliderLoading());
    var data = await sl<ViewSliderUsecase>().call();
    return data.fold(
      (error) => emit(SliderFailure(error)),
      (data) => emit(SliderSuccess(data)),
    );
  }
}
