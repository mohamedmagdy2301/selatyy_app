import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:selaty/core/constants/api_urls.dart';
import 'package:selaty/core/network/dio_client.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/slider_model.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

abstract class RemotlySource {
  Future<dynamic> viewSlider();
}

class RemotlySourceImple extends RemotlySource {
  @override
  Future<List<SliderEntity>> viewSlider() async {
    Response response = await sl<DioApiService>().get(ApiUrls.sliderUrl);
    List<SliderEntity> sliderList = [];
    for (var element in response.data['data']) {
      SliderModel sliderModel = SliderModel.fromJson(element);
      sliderList.add(sliderModel);
    }
    log(sliderList.toString());
    return sliderList;
  }
}
