import 'package:bloc/bloc.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/home/data/models/add_favorite_product_req_param.dart';
import 'package:selaty/features/home/data/models/favorite_products_model/favorite_products_data.dart';
import 'package:selaty/features/home/domain/usecases/add_favorite_product_usecase.dart';
import 'package:selaty/features/home/domain/usecases/view_favorite_product_usecase.dart';

part 'add_favorite_product_state.dart';

class AddFavoriteProductCubit extends Cubit<AddFavoriteProductState> {
  AddFavoriteProductCubit() : super(AddFavoriteProductInitial());

  List<FavoriteProductsData> favoriteProductsList = [];
  final Set<String> favoriteProductIds = {};
  Future<void> viewFavoriteProduct() async {
    var data = await sl<ViewFavoriteProductUsecase>().call();

    data.fold(
      (error) => emit(ViewFavoriteProductError(error)),
      (list) {
        favoriteProductsList = list;
        emit(ViewFavoriteProductSuccess());
      },
    );
  }

  Future<void> addFavoriteProduct({required int productId}) async {
    var data = await sl<AddFavoriteProductUsecase>().call(
      param: AddFavoriteProductReqParam(favoId: productId),
    );
    data.fold(
      (error) => emit(AddFavoriteProductError(error)),
      (data) async {
        if (favoriteProductIds.contains(productId.toString())) {
          favoriteProductIds.remove(productId.toString());
        } else {
          favoriteProductIds.add(productId.toString());
        }
        await viewFavoriteProduct();
        emit(AddFavoriteProductSuccess());
      },
    );
  }
}
