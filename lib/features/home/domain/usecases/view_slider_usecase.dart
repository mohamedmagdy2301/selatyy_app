import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/domain/repo/view_silder_repo.dart';

class ViewSliderUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    var data = await sl<HomeRepo>().viewSlider();
    return data.fold(
      (error) => left("error : $error"),
      (data) => right(data),
    );
  }
}
