import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/features/home/domain/entities/categories_entity.dart';

class SubCategories extends SubCategoriesEntity {
  int? id;
  int? ord;
  String? type;
  int? parentId;
  String? name;
  String? img;
  String? details;

  SubCategories({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.name,
    this.img,
    this.details,
  }) : super(
          idSubCategory: id ?? 0,
          nameSubCategory: name ?? '',
          imageSubCategory: img ?? '',
          detailsSubCategory: details ?? '',
        );

  factory SubCategories.fromJson(Map<String, dynamic> json) => SubCategories(
        id: json['id'] as int?,
        ord: json['ord'] as int?,
        type: json['type'] as String?,
        parentId: json['parent_id'] as int?,
        name: json['name'] as String?,
        img: "$kBaseUrlForImage${json['img']}" as String?,
        details: json['details'] as String?,
      );
}
