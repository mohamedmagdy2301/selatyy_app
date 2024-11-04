import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';

class TotalPriceCartScreen extends StatelessWidget {
  const TotalPriceCartScreen({
    super.key,
    required this.cartUser,
  });

  final CartUserModel cartUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.isLandscape ? context.width * .7 : context.width,
      margin: EdgeInsets.symmetric(
        horizontal: context.width * .04,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * .03,
        vertical: context.height * .02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryWhite,
      ),
      child: Row(
        children: [
          SizedBox(
            width:
                context.isLandscape ? context.width * .4 : context.width * .5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "البنود",
                  style: StylesManager.textStyle_10_Light(context)
                      .copyWith(color: primaryDarkGrey),
                ),
                Text(
                  "المجموع الفرعي",
                  style: StylesManager.textStyle_10_Light(context)
                      .copyWith(color: primaryDarkGrey),
                ),
                Text(
                  "رسوم التوصيل",
                  style: StylesManager.textStyle_10_Light(context)
                      .copyWith(color: primaryDarkGrey),
                ),
                Padding(
                  padding: EdgeInsets.only(top: context.height * .02),
                  child: Text(
                    "الاجمالي",
                    style: StylesManager.textStyle_14_bold(context)
                        .copyWith(color: primaryBlack),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cartUser.totalQuantity.toString(),
                style: StylesManager.textStyle_10_Light(context)
                    .copyWith(color: primaryDarkGrey),
              ),
              Text(
                "${cartUser.totalPrice} جنية",
                style: StylesManager.textStyle_10_Light(context)
                    .copyWith(color: primaryDarkGrey),
              ),
              Text(
                "مجاني",
                style: StylesManager.textStyle_10_Light(context)
                    .copyWith(color: primaryDarkGrey),
              ),
              Padding(
                padding: EdgeInsets.only(top: context.height * .02),
                child: Text(
                  "${cartUser.totalPrice} جنية",
                  style: StylesManager.textStyle_14_bold(context)
                      .copyWith(color: primaryBlack),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
