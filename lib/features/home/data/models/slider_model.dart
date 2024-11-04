// ignore_for_file: overridden_fields

import 'package:selaty/features/home/domain/entities/slider_entity.dart';

class SliderModel extends SliderEntity {
  @override
  String image;
  SliderModel({required this.image}) : super(image: image);
  factory SliderModel.fromJson(Map<String, dynamic> json) {
    return SliderModel(
      image: json['img'],
    );
  }
}
