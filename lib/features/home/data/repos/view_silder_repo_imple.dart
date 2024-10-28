import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/source/remotly_source.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:selaty/features/home/domain/repo/view_silder_repo.dart';

class HomeRepoImple extends HomeRepo {
  @override
  Future<Either<String, List<SliderEntity>>> viewSlider() async {
    try {
      var data = await sl<RemotlySource>().viewSlider();
      return right(data);
    } on DioException catch (e) {
      return left(e.toString());
    } catch (e) {
      log(e.toString());
      return left(e.toString());
    }
  }
}
