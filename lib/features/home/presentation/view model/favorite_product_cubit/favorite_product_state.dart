class FavoriteProductState {}

final class FavoriteProductInitial extends FavoriteProductState {}

final class AddFavoriteProductLoading extends FavoriteProductState {}

final class AddFavoriteProductSuccess extends FavoriteProductState {}

final class AddFavoriteProductError extends FavoriteProductState {
  final String message;
  AddFavoriteProductError(this.message);
}

final class ViewFavoriteProductLoading extends FavoriteProductState {}

final class ViewFavoriteProductEmpty extends FavoriteProductState {}

final class ViewFavoriteProductSuccess extends FavoriteProductState {}

final class ViewFavoriteProductError extends FavoriteProductState {
  final String message;
  ViewFavoriteProductError(this.message);
}
