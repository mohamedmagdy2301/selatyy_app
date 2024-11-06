import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class AppBarTitleRegeisterScreen extends StatelessWidget {
  const AppBarTitleRegeisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          StringsApp.createAccountNew,
          style: StylesManager.textStyle_28_normal(context),
        ),
        Text(
          StringsApp.enterYourDataNew,
          textDirection: TextDirection.rtl,
          style: StylesManager.textStyle_9_Medium(context).copyWith(
            color: primaryGrey,
          ),
        ),
      ],
    );
  }
}

class AppBarTitleLoginScreen extends StatelessWidget {
  const AppBarTitleLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          StringsApp.loginAccount,
          style: StylesManager.textStyle_28_normal(context),
        ),
        Text(
          StringsApp.enterYourData,
          textDirection: TextDirection.rtl,
          style: StylesManager.textStyle_9_Medium(context).copyWith(
            color: primaryGrey,
          ),
        ),
      ],
    );
  }
}
