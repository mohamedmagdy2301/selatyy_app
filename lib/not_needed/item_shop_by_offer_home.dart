import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class ItemShopByOfferHome1 extends StatelessWidget {
  const ItemShopByOfferHome1({
    super.key,
    required this.color,
    required this.number,
  });
  final Color color;
  final String number;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      width: context.width * 0.26,
      child: Container(
        padding: EdgeInsets.all(context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "عرض",
              style: StylesManager.textStyle_10_Light(context),
            ),
            Text(
              number,
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

class ItemShopByOfferHome2 extends StatelessWidget {
  const ItemShopByOfferHome2({
    super.key,
    required this.color,
    required this.text,
  });
  final Color color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.14,
      width: context.width * 0.26,
      child: Container(
        padding: EdgeInsets.all(context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: StylesManager.textStyle_11_Light(context).copyWith(
            color: primaryWhite,
          ),
        ),
      ),
    );
  }
}
