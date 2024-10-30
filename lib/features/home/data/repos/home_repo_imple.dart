import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/errors/failure.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/categories_model/categories.dart';
import 'package:selaty/features/home/data/models/products_model/products_model.dart';
import 'package:selaty/features/home/data/source/home_remotly_source.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class HomeRepoImple extends HomeRepo {
  @override
  Future<Either<String, List<SliderEntity>>> viewSlider() async {
    try {
      var data = await sl<HomeRemotlySource>().viewSlider();
      return right(data);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<Categories>>> viewCategories() async {
    try {
      // List<Categories> dataLocal = await sl<HomeLocalSource>().viewCategories();
      // if (dataLocal.isNotEmpty) {
      //   return right(dataLocal);
      // }
      Either<String, List<Categories>> dataRemotly =
          await sl<HomeRemotlySource>().viewCategories();
      return dataRemotly.fold(
        (error) => left(error),
        (data) => right(data),
      );
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }

  @override
  Future<Either<String, List<ProductEntity>>> viewProducts() async {
    try {
      ProductsModel dataRemotly = await sl<HomeRemotlySource>().viewProducts();
      if (dataRemotly.status!) {
        return right(dataRemotly.data!.data!);
      }
      return left(dataRemotly.message!);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioException(e).message);
    } catch (e) {
      return left("حدث خطأ غير متوقع");
    }
  }
}
