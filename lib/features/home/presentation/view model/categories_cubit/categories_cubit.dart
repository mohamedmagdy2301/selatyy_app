import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/categories_modell/categoriesdart';
import 'package:selaty/features/home/domain/usecases/view_categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  getCategories() async {
    emit(CategoriesLoading());
    Either<String, List<Categories>> categories =
        await sl<ViewCategoriesUsecase>().call();
    categories.fold(
      (error) => emit(CategoriesFailure(error)),
      (categories) => emit(CategoriesSuccess(categories)),
    );
  }
}
