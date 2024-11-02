import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/domain/usecases/view_products_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());
  Set<ProductEntity> productsList = {};
  List<ProductEntity> productsListHome = [];

  Future<void> getProducts(int page) async {
    if (page == 1) {
      emit(ProductsLoading());
    } else {
      emit(ProductsPagenationLoading());
    }
    Either<String, List<ProductEntity>> data =
        await sl<ViewProductsUseCase>().call(param: page);
    data.fold(
      (error) {
        if (page == 1) {
          return emit(ProductsFailure(error));
        }
        return emit(ProductsPagenationFailure(error));
      },
      (data) {
        productsList.addAll(data);
        if (page == 1) {
          productsListHome = data;
        }
        return emit(ProductsSuccess(productsListHome));
      },
    );
  }
}
