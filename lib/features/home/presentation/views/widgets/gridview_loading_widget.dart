import 'package:flutter/material.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewLoadingWidget extends StatefulWidget {
  const GridViewLoadingWidget({
    super.key,
  });

  @override
  State<GridViewLoadingWidget> createState() => _GridViewLoadingWidgetState();
}

class _GridViewLoadingWidgetState extends State<GridViewLoadingWidget> {
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      effect: shimmerEffect(),
      enabled: true,
      child: SizedBox(
        height: context.height * 0.35,
        child: GridView.builder(
          itemCount: products.length,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemProductHome(
              product: products[index],
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4.5 / 3.5,
          ),
        ),
      ),
    );
  }

  List<ProductEntity> products = List.filled(
      5,
      ProductEntity(
        id: 0,
        name: "mmmmmmm",
        details: "mmmmmmmmmmmmmmm",
        price: "mmmm mmm",
        image: "30.jpg",
        isFavorite: 0,
      ));
}
