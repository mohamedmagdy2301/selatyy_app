import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class ItemShopByOfferHome extends StatelessWidget {
  const ItemShopByOfferHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      width: context.width * 0.26,
      child: Container(
        padding: EdgeInsets.all(context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: secondaryOrange,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "عرض",
              style: StylesManager.textStyle_10_Light(context),
            ),
            Text(
              "10%",
              style: StylesManager.textStyle_30_bold(context).copyWith(
                color: secondaryPurple,
              ),
            ),
            Text(
              "خصم",
              style: StylesManager.textStyle_10_Light(context),
            )
          ],
        ),
      ),
    );
  }
}
