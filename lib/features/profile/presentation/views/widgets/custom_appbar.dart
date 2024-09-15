import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomAppbarProfile {
<<<<<<< HEAD
  static List<Widget> appBarActions(BuildContext context) {
=======
  static List<Widget> appBarActions(BuildContext context, Function()? onTap) {
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
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
<<<<<<< HEAD
          Navigator.pop(context);
        },
        child: const Center(
          child: Icon(
            CupertinoIcons.camera_on_rectangle,
            textDirection: TextDirection.ltr,
            color: primaryDarkGrey,
            size: 20,
=======
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
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
          ),
        ),
      ),
      SizedBox(width: context.width * 0.04),
    ];
  }
}
