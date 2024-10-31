import 'product.dart';

class FavoriteProductsData {
  int? id;
  int? favoId;
  int? priceWithDiscount;
  Product? product;

  FavoriteProductsData(
      {this.id, this.favoId, this.priceWithDiscount, this.product});

  factory FavoriteProductsData.fromJson(Map<String, dynamic> json) =>
      FavoriteProductsData(
        id: json['id'] as int?,
        favoId: json['favo_id'] as int?,
        priceWithDiscount: json['price_with_discount'] as int?,
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'favo_id': favoId,
        'price_with_discount': priceWithDiscount,
        'product': product?.toJson(),
      };
}
