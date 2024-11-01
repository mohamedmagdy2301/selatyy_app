import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_state.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';

class BuildProductHome extends StatelessWidget {
  const BuildProductHome(
      {super.key, required this.product, required this.products});
  final ProductEntity product;
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavoriteProductCubit, FavoriteProductState>(
      listener: (context, state) {
        if (state is AddFavoriteProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        var isFavorite = context
            .read<FavoriteProductCubit>()
            .favoriteProductIds
            .contains(product.id!.toString());
        return ItemProductHome(
          product: product,
          isFavorite: isFavorite,
          onFavorite: () {
            context
                .read<FavoriteProductCubit>()
                .addFavoriteProduct(productId: product.id!);
          },
          products: products,
        );
      },
    );
  }
}
