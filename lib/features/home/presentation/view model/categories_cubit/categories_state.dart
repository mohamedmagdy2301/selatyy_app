part of 'categories_cubit.dart';

class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class CategoriesSuccess extends CategoriesState {
  final List<Categories> categoriesList;

  CategoriesSuccess(this.categoriesList);
}

final class CategoriesFailure extends CategoriesState {
  final String errorMessage;

  CategoriesFailure(this.errorMessage);
}
