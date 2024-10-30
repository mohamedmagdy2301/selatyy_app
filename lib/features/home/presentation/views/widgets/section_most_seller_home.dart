import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_products_home.dart';

class SectionMostSellerHome extends StatelessWidget {
  const SectionMostSellerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: context.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "المنتجات الاكثر مبيعاً",
                style: StylesManager.textStyle_11_bold(context),
              ),
              Text(
                " << عرض الكل",
                style: StylesManager.textStyle_9_Medium(context).copyWith(
                  color: primaryDarkGrey,
                ),
              ),
            ],
          ),
        ),
        BuildProductsHome(),
      ],
    );
  }
}
