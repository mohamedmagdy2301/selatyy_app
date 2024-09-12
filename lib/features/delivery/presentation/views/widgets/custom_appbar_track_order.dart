import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/functions.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class CustomAppbarTrackOrder {
  static List<Widget> appBarActions(BuildContext context) {
    return [
      SizedBox(width: context.width * 0.02),
      GestureDetector(
        onTap: () {
          GoRouter.of(context).push(RoutersManager.kHomeScreen);
        },
        child: Container(
          height: context.height * 0.045,
          width: context.height * 0.045,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: primaryLightGrey),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            CupertinoIcons.home,
            color: primaryDarkGrey,
            size: 3.5 * context.textScale,
          ),
        ),
      ),
      Spacer(),
      Text(
        StringsApp.trackOrder,
        style: StylesManager.textStyle_11_bold(context).copyWith(
          color: primaryBlack,
        ),
      ),
      Spacer(),
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
