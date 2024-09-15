import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class SectionAlreadyHaveAccount extends StatelessWidget {
  const SectionAlreadyHaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          StringsApp.alreadyHaveAccount,
          style: StylesManager.textStyle_8_Medium(context).copyWith(
            color: primaryDarkGrey,
          ),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(RoutersManager.kLoginScreen);
          },
          child: Text(
            StringsApp.loginAccount,
            style: StylesManager.textStyle_8_Medium(context).copyWith(
              color: primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}
