import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomAppbarCart {
  static List<Widget> appBarActions(BuildContext context) {
    return [
      SizedBox(width: context.width * 0.02),
      GestureDetector(
        onTap: () {},
        child: Container(
          height: context.height * 0.045,
          width: context.height * 0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryLightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            CupertinoIcons.camera_on_rectangle,
            color: primaryDarkGrey,
            size: 3.5 * context.textScale,
          ),
        ),
      ),
      const Spacer(),
      Text(
        StringsApp.cartShopping,
        style: StylesManager.textStyle_11_bold(context).copyWith(
          color: primaryBlack,
        ),
      ),
      const Spacer(),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          Navigator.pop(context);
        },
        child: Container(
          height: context.height * 0.045,
          width: context.height * 0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryLightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Icon(
              CupertinoIcons.back,
              textDirection: TextDirection.ltr,
              color: primaryDarkGrey,
              size: 4 * context.textScale,
            ),
          ),
        ),
      ),
      SizedBox(width: context.width * 0.02),
    ];
  }
}
