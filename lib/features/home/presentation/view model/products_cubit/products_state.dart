part of 'products_cubit.dart';

class ProductsState {}

final class ProductsInitial extends ProductsState {}

final class ProductsLoading extends ProductsState {}

final class ProductsSuccess extends ProductsState {
  final List<ProductEntity> productsList;

  ProductsSuccess(this.productsList);
}

final class ProductsPagenationLoading extends ProductsState {}

final class ProductsPagenationFailure extends ProductsState {
  final String errorMessage;

  ProductsPagenationFailure(this.errorMessage);
}

final class ProductsFailure extends ProductsState {
  final String errorMessage;

  ProductsFailure(this.errorMessage);
}
