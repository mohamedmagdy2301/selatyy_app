import 'package:selaty/features/home/domain/entities/categories_entity.dart';

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
          id: data![0].id!,
          image: data[0].img!,
          name: data[0].name!,
          details: data[0].details!,
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

class Categories {
  int? id;
  int? ord;
  String? type;
  int? parentId;
  String? name;
  String? img;
  String? details;

  Categories({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.name,
    this.img,
    this.details,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json['id'] as int?,
        ord: json['ord'] as int?,
        type: json['type'] as String?,
        parentId: json['parent_id'] as int?,
        name: json['name'] as String?,
        img: json['img'] as String?,
        details: json['details'] as String?,
      );
}
