import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomLoadingCategoriesCard extends StatelessWidget {
  const CustomLoadingCategoriesCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: true,
      effect: shimmerEffect(),
      child: SizedBox(
        height: context.height * 0.15,
        child: ListView.builder(
          itemCount: 10,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  kCatagoryImage,
                  width: context.width * 0.3,
                  fit: BoxFit.fill,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
