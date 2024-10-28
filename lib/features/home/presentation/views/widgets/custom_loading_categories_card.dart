import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/data/models/categories_model.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_categories_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingCategoriesCard extends StatelessWidget {
  const CustomLoadingCategoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: ShimmerEffect(
        baseColor: Colors.grey.shade400,
        highlightColor: Colors.grey.shade200,
        duration: Duration(seconds: 1),
      ),
      child: SizedBox(
        height: context.height * 0.15,
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return ItemCategoriesHome(
              categories: List.filled(
                10,
                Categories(
                  name: 'mnbvbnm',
                  img: "2023_12_10_09_51_27_alktronyat.jpg",
                ),
              )[index],
            );
          },
        ),
      ),
    );
  }
}
