import 'package:hive/hive.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';

class CartRepoImpl {
  Future<void> saveUserCart(String token) async {
    final Box<AllCartUserModel> box = Hive.box<AllCartUserModel>(cartUsersBox);

    // Check if the user already exists
    bool userExists = false;
    for (var i = 0; i < box.length; i++) {
      AllCartUserModel? userCart = box.getAt(i);
      if (userCart != null &&
          userCart.cartUsers != null &&
          userCart.cartUsers!.any((user) => user.tonken == token)) {
        userExists = true;
        break;
      }
    }

    // Add the new user only if they don't exist
    if (!userExists) {
      CartUserModel newUserCart = CartUserModel(
        tonken: token,
        productCart: [],
      );

      AllCartUserModel allCartUserModel = AllCartUserModel(
        cartUsers: [newUserCart],
      );
      await box.add(allCartUserModel); // Adds to the end of the box
    }
  }

  CartUserModel? getUserCart(String token) {
    final Box<AllCartUserModel> box = Hive.box<AllCartUserModel>(cartUsersBox);

    for (var i = 0; i < box.length; i++) {
      AllCartUserModel? userCart = box.getAt(i);
      if (userCart != null && userCart.cartUsers != null) {
        for (var cartUser in userCart.cartUsers!) {
          if (cartUser.tonken == token) {
            return cartUser;
          }
        }
      }
    }

    return null;
  }

  Future<void> addProductToCart(String token, ProductCart product) async {
    final Box<AllCartUserModel> box = Hive.box<AllCartUserModel>(cartUsersBox);
    bool userCartUpdated = false;

    for (var i = 0; i < box.length; i++) {
      AllCartUserModel? userCart = box.getAt(i);
      if (userCart != null && userCart.cartUsers != null) {
        for (var cartUser in userCart.cartUsers!) {
          if (cartUser.tonken == token) {
            // Remove any existing product with the same ID before adding
            cartUser.productCart
                ?.removeWhere((cartProduct) => cartProduct.id == product.id);
            cartUser.productCart?.add(product);

            // Save the updated cart for the user
            await box.putAt(i, userCart);
            userCartUpdated = true;
            break;
          }
        }
        if (userCartUpdated)
          break; // Exit outer loop if the user was found and updated
      }
    }

    if (!userCartUpdated) {
      throw Exception("User cart not found for token: $token");
    }
  }
}
