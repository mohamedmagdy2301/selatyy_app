import 'sub_cat.dart';

class Categories {
  int? id;
  int? ord;
  String? type;
  int? parentId;
  String? name;
  String? img;
  String? details;
  List<SubCategories>? subCat;

  Categories({
    this.id,
    this.ord,
    this.type,
    this.parentId,
    this.name,
    this.img,
    this.details,
    this.subCat,
  });

  factory Categories.fromJson(Map<String, dynamic> json) => Categories(
        id: json['id'] as int?,
        ord: json['ord'] as int?,
        type: json['type'] as String?,
        parentId: json['parent_id'] as int?,
        name: json['name'] as String?,
        img: json['img'] as String?,
        details: json['details'] as String?,
        subCat: (json['sub_cat'] as List<dynamic>?)
            ?.map((e) => SubCategories.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
