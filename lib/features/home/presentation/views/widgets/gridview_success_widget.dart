import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';

class GridViewSuccessWidget extends StatelessWidget {
  const GridViewSuccessWidget({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.32,
      child: GridView.builder(
        itemCount: products.length - 1,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final product = products[index + 1];
          return BlocConsumer<AddFavoriteProductCubit, AddFavoriteProductState>(
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
              final isFavorite = context
                  .read<AddFavoriteProductCubit>()
                  .isFavorite(product.id!);
              return ItemProductHome(
                product: product,
                isFavorite: isFavorite,
                onFavorite: () {
                  context
                      .read<AddFavoriteProductCubit>()
                      .addFavoriteProduct(productId: product.id!);
                },
                products: products,
              );
            },
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4.7 / 3.7,
        ),
      ),
    );
  }
}
