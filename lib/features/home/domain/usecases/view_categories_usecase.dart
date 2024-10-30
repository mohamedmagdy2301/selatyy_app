import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/data/models/categories_modell/categories.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class ViewCategoriesUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either<String, List<Categories>>> call({void param}) async {
    var data = await sl<HomeRepo>().viewCategories();
    log(data.toString());
    log("-----------------------");
    return data.fold(
      (error) => left(error),
      (data) => right(data),
    );
  }
}
