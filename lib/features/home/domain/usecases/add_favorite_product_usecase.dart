import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/data/models/add_favorite_product_req_param.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class AddFavoriteProductUsecase
    extends UseCase<Either<String, void>, AddFavoriteProductReqParam> {
  @override
  Future<Either<String, void>> call({AddFavoriteProductReqParam? param}) async {
    var data = await sl<HomeRepo>().addFavoriteProduct(param!);
    return data.fold(
      (error) => left(error),
      (data) => right(null),
    );
  }
}
