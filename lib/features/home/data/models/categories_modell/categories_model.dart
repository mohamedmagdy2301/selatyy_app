import 'package:selaty/features/home/domain/entities/categories_entity.dart';

import 'categoriesdart';

class CategoriesModel extends CategoriesEntity {
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<Categories>? data;

  CategoriesModel({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  }) : super(
          idCategory: data![0].id ?? 0,
          nameCategory: data[0].name ?? '',
          imageCategory: data[0].img ?? '',
          detailsCategory: data[0].details ?? '',
          subCategories: data[0].subCat!,
        );

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      result: json['result'] as bool?,
      errorMessage: json['error_message'] as String?,
      errorMessageEn: json['error_message_en'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }
}
