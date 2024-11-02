import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_item_product_home.dart';

class GridViewProductsHomeSuccess extends StatelessWidget {
  const GridViewProductsHomeSuccess({
    super.key,
    required this.products,
  });

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    final double height = context.width > 600
        ? context.height * 0.34
        : (context.isLandscape)
            ? context.height * .33
            : context.height * 0.31;
    return SizedBox(
      height: height,
      child: GridView.builder(
        itemCount: products.length - 1,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 4.5 / 3.7,
        ),
        itemBuilder: (context, index) {
          return BuildItemProductHome(
            product: products[index + 1],
          );
        },
      ),
    );
  }
}
