import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class ViewFavoriteProductUsecase extends UseCase<Either, dynamic> {
  @override
  Future<Either> call({param}) async {
    var data = await sl<HomeRepo>().viewFavoriteProduct();
    return data.fold(
      (error) => left(error),
      (data) {
        return right(data);
      },
    );
  }
}
