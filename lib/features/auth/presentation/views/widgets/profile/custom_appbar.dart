import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';

class CustomAppbarProfile {
  static Widget appBarActions(BuildContext context, Function()? onTap) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
        onTap!();
      },
      child: Icon(
        CupertinoIcons.arrow_right,
        color: primaryDarkGrey,
        size: context.textScale * 7,
      ),
    );
  }
}
