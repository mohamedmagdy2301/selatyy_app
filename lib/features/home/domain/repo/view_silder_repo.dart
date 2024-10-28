import 'package:dartz/dartz.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

abstract class HomeRepo {
  Future<Either<String, List<SliderEntity>>> viewSlider();
}
