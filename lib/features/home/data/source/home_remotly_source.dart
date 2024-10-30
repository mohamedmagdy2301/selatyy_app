import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/categories_modell/categories.dart';
import 'package:selaty/features/home/data/models/categories_modell/categories_model.dart';
import 'package:selaty/features/home/data/models/slider_model.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

abstract class HomeRemotlySource {
  Future<List<SliderEntity>> viewSlider();
  Future<Either<String, List<Categories>>> viewCategories();
}

class HomeRemotlySourceImple extends HomeRemotlySource {
  @override
  Future<List<SliderEntity>> viewSlider() async {
    Response response = await sl<DioApiService>().get(ApiUrls.sliderUrl);
    List<SliderEntity> sliderList = [];
    for (var element in response.data['data']) {
      SliderModel sliderModel = SliderModel.fromJson(element);
      sliderList.add(sliderModel);
    }
    return sliderList;
  }

  @override
  Future<Either<String, List<Categories>>> viewCategories() async {
    Response response = await sl<DioApiService>().get(ApiUrls.categoriesUrl);
    CategoriesModel categoriesModel = CategoriesModel.fromJson(response.data);

    if (categoriesModel.result!) {
      return right(categoriesModel.data ?? []);
    }
    return left(categoriesModel.errorMessage!);
  }
}


      // SharedPreferencesManager.setData(
      //   key: categoriesKey,
      //   value: categoriesModel.data,
      // );