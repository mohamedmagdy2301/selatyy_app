import 'package:dartz/dartz.dart';
import 'package:selaty/features/home/data/models/categories_model.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

abstract class HomeRepo {
  Future<Either<String, List<SliderEntity>>> viewSlider();
  Future<Either<String, List<Categories>>> viewCategories();
  // Future<Either<String, List<SliderEntity>>> viewSubCategories();
}
