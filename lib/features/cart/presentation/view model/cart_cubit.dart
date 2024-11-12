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
  final CartRepoImpl _cartRepository;
  final String _token;

  CartCubit(this._cartRepository)
      : _token = SharedPreferencesManager.getData(key: tokenKey),
        super(CartState(cartUser: CartUserModel(tonken: "", productCart: []))) {
    _initializeCart();
  }

  Future<void> _initializeCart() async {
    final loadedCartUser = _cartRepository.getUserCart(_token);
    emit(CartState(
        cartUser:
            loadedCartUser ?? CartUserModel(tonken: _token, productCart: [])));
  }

  void refreshCart() async {
    final updatedCartUser = _cartRepository.getUserCart(_token);
    emit(CartState(cartUser: updatedCartUser ?? state.cartUser));
  }

  Future<void> addProduct(ProductCart product) async {
    try {
      await _cartRepository.addProductToCart(_token, product);
      final updatedCartUser = state.cartUser;
      updatedCartUser.calculateTotalPrice();
      updatedCartUser.calculateTotalQuantity();
      emit(CartState(cartUser: updatedCartUser));
    } catch (e) {
      print("Error adding product: $e"); // Handle error appropriately
    }
  }

  Future<void> removeProduct(String productId) async {
    try {
      final updatedCartUser = state.cartUser;
      updatedCartUser.productCart
          ?.removeWhere((product) => product.id == productId);
      updatedCartUser.calculateTotalPrice();
      updatedCartUser.calculateTotalQuantity();
      await _cartRepository.saveUserCart(_token);
      emit(CartState(cartUser: updatedCartUser));
    } catch (e) {
      print("Error removing product: $e"); // Handle error appropriately
    }
  }
}
