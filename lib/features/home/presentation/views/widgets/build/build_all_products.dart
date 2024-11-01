import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_state.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_all_products_screen.dart';

class BuildAllProducts extends StatelessWidget {
  const BuildAllProducts({
    super.key,
    required this.products,
    required this.index,
  });
  final List<ProductEntity> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FavoriteProductCubit>();
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
        var isFavorite =
            cubit.favoriteProductIds.contains(products[index].id!.toString());
        return ItemAllProductScreen(
          product: products[index],
          isFavorite: isFavorite,
          onFavorite: () {
            context
                .read<FavoriteProductCubit>()
                .addFavoriteProduct(productId: products[index].id!);
          },
        );
      },
    );
  }
}
