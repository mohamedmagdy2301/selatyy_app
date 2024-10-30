part of 'add_favorite_product_cubit.dart';

class AddFavoriteProductState {}

final class AddFavoriteProductInitial extends AddFavoriteProductState {}

final class AddFavoriteProductLoading extends AddFavoriteProductState {}

final class AddFavoriteProductSuccess extends AddFavoriteProductState {}

final class AddFavoriteProductError extends AddFavoriteProductState {
  final String message;
  AddFavoriteProductError(this.message);
}
