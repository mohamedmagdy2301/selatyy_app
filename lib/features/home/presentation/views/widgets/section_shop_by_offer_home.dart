import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_shop_by_offer_home.dart';

class SectionShopByOfferHome extends StatelessWidget {
  const SectionShopByOfferHome({super.key});

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
                "تسوق حسب العروض",
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
        SizedBox(height: context.height * 0.01),
        Wrap(
          spacing: context.width * 0.02,
          runSpacing: context.height * 0.01,
          children: [
            for (int i = 0; i < 4; i++) ItemShopByOfferHome(),
          ],
        ),
      ],
    );
  }
}
