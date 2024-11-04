import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:selaty/features/cart/data/repos/cart_repo_impl.dart';

class CartState {
  final CartUserModel cartUser;
  CartState({required this.cartUser});
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState(cartUser: _loadUserCart()));

  static final String _token = SharedPreferencesManager.getData(key: tokenKey);

  static CartUserModel _loadUserCart() {
    return getUserCart(_token) ??
        CartUserModel(tonken: _token, productCart: []);
  }

  void refreshCart() => emit(CartState(cartUser: _loadUserCart()));

  Future<void> addProduct(ProductCart product) async {
    final cartUser = state.cartUser;
    await addProductToCart(_token, product);
    cartUser.calculateTotalPrice();
    cartUser.calculateTotalQuantity();
    await saveUserCart(_token);

    refreshCart();
  }

  // Removes a product from the cart by product ID
  Future<void> removeProduct(String productId) async {
    final cartUser = state.cartUser;
    cartUser.productCart
        ?.removeWhere((product) => product.id.toString() == productId);
    cartUser.calculateTotalPrice();
    cartUser.calculateTotalQuantity();
    await saveUserCart(_token);
    refreshCart();
  }
}
