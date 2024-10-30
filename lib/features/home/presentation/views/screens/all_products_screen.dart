import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/add_favorite_product_cubit/add_favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_all_features.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_all_products_screens.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              // pinned: true,
              floating: true,
              snap: true,
              expandedHeight: context.height * 0.06,
              toolbarHeight: context.height * 0.06,
              actions: CustomAppbarAllFeatures.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.04,
                horizontal: context.width * 0.2,
              ),
              child: GridView.builder(
                itemCount: products.length - 1,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: .04 * context.width,
                  crossAxisSpacing: .015 * context.width,
                  childAspectRatio: 4.4 / 5.5,
                ),
                itemBuilder: (context, index) {
                  return BlocConsumer<AddFavoriteProductCubit,
                      AddFavoriteProductState>(
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
                          .isFavorite(products[index + 1].id!);
                      return ItemAllProductHome(
                        product: products[index + 1],
                        isFavorite: isFavorite,
                        onFavorite: () {
                          context
                              .read<AddFavoriteProductCubit>()
                              .addFavoriteProduct(
                                  productId: products[index + 1].id!);
                        },
                      );
                    },
                  );
                },
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height * 0.04,
                horizontal: context.width * 0.06),
            child: GridView.builder(
              itemCount: products.length - 1,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: .04 * context.width,
                crossAxisSpacing: 10,
                childAspectRatio: 4 / 6.3,
              ),
              itemBuilder: (context, index) {
                return ItemAllProductHome(
                  product: products[index + 1],
                  isFavorite: context
                      .read<AddFavoriteProductCubit>()
                      .isFavorite(products[index + 1].id!),
                  onFavorite: () {
                    context
                        .read<AddFavoriteProductCubit>()
                        .addFavoriteProduct(productId: products[index + 1].id!);
                  },
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
