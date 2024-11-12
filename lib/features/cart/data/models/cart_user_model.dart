import 'package:hive/hive.dart';

part 'cart_user_model.g.dart';

@HiveType(typeId: 0)
class AllCartUserModel {
  @HiveField(0)
  List<CartUserModel>? cartUsers;

  AllCartUserModel({required this.cartUsers});
}

@HiveType(typeId: 1)
class CartUserModel {
  @HiveField(0)
  String? tonken;

  @HiveField(1)
  List<ProductCart>? productCart;

  @HiveField(2)
  double? totalPrice;

  @HiveField(3)
  int? totalQuantity;

  CartUserModel({
    required this.tonken,
    required this.productCart,
    this.totalPrice = 0.0,
    this.totalQuantity = 0,
  }) {
    calculateTotalPrice();
    calculateTotalQuantity();
  }

  void calculateTotalPrice() {
    totalPrice = productCart?.fold(0.0, (sum, item) {
      double itemPrice = item.price ?? 0.0;
      return sum! + (itemPrice * (item.quantity ?? 1));
    });
  }

  void calculateTotalQuantity() {
    totalQuantity = productCart?.fold(0, (sum, item) {
      return sum! + (item.quantity ?? 1);
    });
  }
}

@HiveType(typeId: 2)
class ProductCart {
  @HiveField(0)
  final int? id;

  @HiveField(1)
  final String? name;

  @HiveField(2)
  final String? details;

  @HiveField(3)
  final double? price;

  @HiveField(4)
  String? image;

  @HiveField(5)
  int? isFavorite;

  @HiveField(6)
  int? quantity;

  ProductCart({
    required this.id,
    required this.name,
    this.details,
    required this.price,
    required this.image,
    this.isFavorite,
    required this.quantity,
  });
}
