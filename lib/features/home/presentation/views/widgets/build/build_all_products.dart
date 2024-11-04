import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/products_cubit/products_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/gridview_all_products_loading.dart';
import 'package:selaty/features/home/presentation/views/widgets/gridview_all_products_success.dart';

class BuildAllProductsHome extends StatelessWidget {
  const BuildAllProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    Set<ProductEntity> productsList =
        context.read<ProductsCubit>().productsList;

    return BlocConsumer<ProductsCubit, ProductsState>(
      listener: (context, state) {
        if (state is ProductsSuccess) {
          productsList.addAll(state.productsList);
        }
        if (state is ProductsPagenationFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductsSuccess ||
            state is ProductsPagenationFailure ||
            state is ProductsPagenationLoading) {
          return GridViewAllProductsSuccess(products: productsList);
        } else if (state is ProductsFailure) {
          return const SizedBox.shrink();
        }
        return const GridViewAllProductsLoading();
      },
    );
  }
}
