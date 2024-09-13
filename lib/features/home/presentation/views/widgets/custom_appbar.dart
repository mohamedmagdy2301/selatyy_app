import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomAppbarHome {
  static List<Widget> appBarActions(BuildContext context) {
    return [
      SizedBox(width: context.width * 0.02),
      GestureDetector(
        onTap: () {},
        child: ClipOval(
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.fitHeight,
            width: context.width * 0.09,
          ),
        ),
      ),
      SizedBox(width: context.width * 0.02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "مرحباً محمد مجدي ",
            style: StylesManager.textStyle_9_Medium(context).copyWith(
              color: primaryBlack,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'المنوفيه ,شبين الكوم',
            style: StylesManager.textStyle_8_Medium(context).copyWith(
              color: primaryDarkGrey,
            ),
          ),
        ],
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          Navigator.pop(context);
        },
        child: const Center(
          child: Icon(
            CupertinoIcons.camera_on_rectangle,
            textDirection: TextDirection.ltr,
            color: primaryDarkGrey,
            size: 20,
          ),
        ),
      ),
      SizedBox(width: context.width * 0.04),
    ];
  }
}
