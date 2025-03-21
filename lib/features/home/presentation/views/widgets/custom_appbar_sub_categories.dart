import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';

class CustomAppbarSubCategoriesScreen {
  static List<Widget> appBarActions(BuildContext context, titleAppBar) {
    return [
      GestureDetector(
        onTap: () {
          hideKeyboard();
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
    ];
  }
}
