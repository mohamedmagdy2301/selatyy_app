import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomAppbarProfile {
  static List<Widget> appBarActions(BuildContext context, Function()? onTap) {
    return [
      SizedBox(width: context.width * 0.02),
      Text(
        "مرحباً محمد مجدي ",
        style: StylesManager.textStyle_9_Medium(context).copyWith(
          color: primaryBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          onTap!();
        },
        child: Container(
          height: context.height * 0.045,
          width: context.height * 0.045,
          decoration: BoxDecoration(
            color: primaryWhite,
            border: Border.all(color: primaryLightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Center(
            child: Icon(
              CupertinoIcons.back,
              textDirection: TextDirection.ltr,
              color: primaryDarkGrey,
              size: 20,
            ),
          ),
        ),
      ),
      SizedBox(width: context.width * 0.04),
    ];
  }
}
