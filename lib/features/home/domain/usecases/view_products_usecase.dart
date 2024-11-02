import 'package:dartz/dartz.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/usecase/usecase.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/domain/repo/home_repo.dart';

class ViewProductsUseCase
    extends UseCase<Either<String, List<ProductEntity>>, int> {
  @override
  Future<Either<String, List<ProductEntity>>> call({int? param}) async {
    Either<String, List<ProductEntity>> data =
        await sl<HomeRepo>().viewProducts(page: param!);
    return data.fold(
      (error) => left(error),
      (data) => right(data),
    );
  }
}
