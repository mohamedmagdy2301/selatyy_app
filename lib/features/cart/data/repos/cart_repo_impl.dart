import 'dart:developer';

import 'package:hive/hive.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';

Future<void> saveUserCart(String token) async {
  final Box<CartUserModel> box = Hive.box<CartUserModel>(cartUsersBox);
  for (var i = 0; i < box.length; i++) {
    CartUserModel? userCart = box.getAt(i);
    if (userCart != null && userCart.tonken == token) {
      return;
    }
  }
  CartUserModel newUserCart = CartUserModel(
    tonken: token,
    productCart: [],
  );

  log(newUserCart.toString());
  await box.add(newUserCart);
}

CartUserModel? getUserCart(String token) {
  final Box<CartUserModel> box = Hive.box<CartUserModel>(cartUsersBox);

  for (var i = 0; i < box.length; i++) {
    CartUserModel? userCart = box.getAt(i);
    if (userCart != null && userCart.tonken == token) {
      return userCart;
    }
  }

  return null;
}

Future<void> addProductToCart(String token, ProductCart product) async {
  final Box<CartUserModel> box = Hive.box<CartUserModel>(cartUsersBox);
  bool userCartUpdated = false;

  for (var i = 0; i < box.length; i++) {
    CartUserModel? userCart = box.getAt(i);
    if (userCart != null && userCart.tonken == token) {
      userCart.productCart
          ?.removeWhere((cartProduct) => cartProduct.id == product.id);
      userCart.productCart?.add(product);
      await box.putAt(i, userCart);
      userCartUpdated = true;
      break;
    }
  }
  if (!userCartUpdated) {
    throw Exception("User cart not found for token: $token");
  }
}
