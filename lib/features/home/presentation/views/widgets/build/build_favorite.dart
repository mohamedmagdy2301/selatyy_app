import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_state.dart';
import 'package:selaty/features/home/presentation/views/widgets/body_favorite_products_screen.dart';

class BuildFavorite extends StatefulWidget {
  const BuildFavorite({super.key});

  @override
  State<BuildFavorite> createState() => _BuildFavoriteState();
}

class _BuildFavoriteState extends State<BuildFavorite> {
  @override
  void initState() {
    context.read<FavoriteProductCubit>().viewFavoriteProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
      builder: (context, state) {
        if (state is ViewFavoriteProductLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ViewFavoriteProductError) {
          return Center(
            child: Text(
              state.message,
              style: StylesManager.textStyle_14_bold(context).copyWith(
                color: primaryRed,
              ),
            ),
          );
        }
        return const BodyFavoriteProductsScreen();
      },
    );
  }
}
