import 'favorite_products_data.dart';

class FavoriteProductsModel {
  bool? result;
  String? errorMessage;
  String? errorMessageEn;
  List<FavoriteProductsData>? data;

  FavoriteProductsModel({
    this.result,
    this.errorMessage,
    this.errorMessageEn,
    this.data,
  });

  factory FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    return FavoriteProductsModel(
      result: json['result'] as bool?,
      errorMessage: json['error_message'] as String?,
      errorMessageEn: json['error_message_en'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => FavoriteProductsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'result': result,
        'error_message': errorMessage,
        'error_message_en': errorMessageEn,
        'data': data?.map((e) => e.toJson()).toList(),
      };
}
