import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/presentation/view%20model/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/views/screens/favorits_products_screen.dart';

class BuildFavorite extends StatelessWidget {
  const BuildFavorite({super.key});

  @override
  Widget build(BuildContext context) {
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
        return FavoritsProductsScreen();
      },
    );
  }
}
