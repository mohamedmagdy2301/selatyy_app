import 'package:bloc/bloc.dart';

part 'add_favorite_product_state.dart';

class AddFavoriteProductCubit extends Cubit<AddFavoriteProductState> {
  AddFavoriteProductCubit() : super(AddFavoriteProductInitial());

  static const String favoriteProductKey = 'favorite_product_key';

  final List<int> _favoriteProductIds = [];
  bool isFavorite(int productId) => _favoriteProductIds.contains(productId);

  void addFavoriteProduct({required int productId}) {
    if (_favoriteProductIds.contains(productId)) {
      _favoriteProductIds.remove(productId);
      // SharedPreferencesManager.removeData(key: favoriteProductKey);
    } else {
      _favoriteProductIds.add(productId);
      // SharedPreferencesManager.setData(
      //   key: favoriteProductKey,
      //   value: _favoriteProductIds,
      // );
    }
    emit(AddFavoriteProductSuccess());
  }
}
