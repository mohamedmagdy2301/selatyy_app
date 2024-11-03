import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_item_product_home.dart';

class GridViewAllProductsSuccess extends StatelessWidget {
  const GridViewAllProductsSuccess({
    super.key,
    required this.products,
  });

  final Set<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.width > 600;

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 0.015 * context.height,
        horizontal: 0.03 * context.width,
      ),
      child: GridView.builder(
        itemCount: products.length - 1,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        gridDelegate:
            sliverGridDelegateWithFixedCrossAxisCount(context, isTablet),
        itemBuilder: (context, index) {
          return BuildItemProductHome(
            product: products.elementAt(index + 1),
          );
        },
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount
      sliverGridDelegateWithFixedCrossAxisCount(
          BuildContext context, bool isTablet) {
    int crossAxisCount = context.isLandscape ? (isTablet ? 4 : 3) : 2;

    double childAspectRatio = context.isLandscape
        ? (isTablet ? 4.5 / 6.4 : 4.4 / 4.5)
        : (isTablet ? 4 / 4.7 : 4 / 6.3);

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 0.02 * context.height,
      crossAxisSpacing: 0.03 * context.width,
      childAspectRatio: childAspectRatio,
    );
  }
}
