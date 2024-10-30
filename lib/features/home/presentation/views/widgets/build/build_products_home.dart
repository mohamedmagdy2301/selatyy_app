import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/presentation/view%20model/products_cubit/products_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/gridview_loading_widget.dart';
import 'package:selaty/features/home/presentation/views/widgets/gridview_success_widget.dart';

class BuildProductsHome extends StatelessWidget {
  const BuildProductsHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        if (state is ProductsSuccess) {
          return GridViewSuccessWidget(products: state.productsList);
        } else if (state is ProductsFailure) {
          return SizedBox.shrink();
        }
        return GridViewLoadingWidget();
      },
    );
  }
}
