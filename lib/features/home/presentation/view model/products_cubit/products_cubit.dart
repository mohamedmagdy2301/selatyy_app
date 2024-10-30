import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/domain/usecases/view_products_usecase.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> getProducts() async {
    emit(ProductsLoading());
    Either<String, List<ProductEntity>> data =
        await sl<ViewProductsUseCase>().call();
    data.fold(
      (error) => emit(ProductsFailure(error)),
      (data) => emit(ProductsSuccess(data)),
    );
  }
}
