import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class ViewProductsUseCase
    extends UseCase<Either<String, List<ProductEntity>>, dynamic> {
  @override
  Future<Either<String, List<ProductEntity>>> call({param}) async {
    Either<String, List<ProductEntity>> data =
        await sl<HomeRepo>().viewProducts();
    return data.fold(
      (error) => left(error),
      (data) => right(data),
    );
  }
}
