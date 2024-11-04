import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_state.dart';

class IconFavorite extends StatelessWidget {
  const IconFavorite({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    // Determine screen properties for responsiveness
    final isTablet = context.width > 600;
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
        bool isFavorite = !context
            .read<FavoriteProductCubit>()
            .favoriteProductIds
            .contains(product.id!.toString());
        return IconButton(
          icon: Icon(
            !isFavorite ? Icons.favorite : Icons.favorite_border,
            size: isTablet ? 50 : 40,
            color: !isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            context.read<FavoriteProductCubit>().addFavoriteProduct(
                  productId: product.id!,
                );
          },
        );
      },
    );
  }
}
