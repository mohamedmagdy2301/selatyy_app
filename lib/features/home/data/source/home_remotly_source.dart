import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/add_favorite_product_req_param.dart';
import 'package:selaty/features/home/data/models/categories_model/categories.dart';
import 'package:selaty/features/home/data/models/categories_model/categories_model.dart';
import 'package:selaty/features/home/data/models/products_model/products_model.dart';
import 'package:selaty/features/home/data/models/slider_model.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

abstract class HomeRemotlySource {
  Future<List<SliderEntity>> viewSlider();
  Future<Either<String, List<Categories>>> viewCategories();
  Future<ProductsModel> viewProducts();
  Future<void> addFavoriteProduct(AddFavoriteProductReqParam param);
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

  @override
  Future<ProductsModel> viewProducts() async {
    Response response =
        await sl<DioApiService>().get("${ApiUrls.productsUrl}?page=1");
    ProductsModel productsModel = ProductsModel.fromJson(response.data);
    return productsModel;
  }

  @override
  Future<void> addFavoriteProduct(AddFavoriteProductReqParam param) async {
    await sl<DioApiService>().post(
      ApiUrls.addUserFavoriteUrl,
      data: param.toJson(),
      options: Options(
        headers: {
          'Authorization':
              "Bearer ${SharedPreferencesManager.getData(key: tokenKey)}",
        },
      ),
    );
  }
}

//  if (productsModel.status!) {
//     return right(categoriesModel.data ?? []);
//   }

// SharedPreferencesManager.setData(
//   key: categoriesKey,
//   value: categoriesModel.data,
// );
