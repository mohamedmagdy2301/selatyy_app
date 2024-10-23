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
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringsApp.alreadyHaveAccount,
          style: StylesManager.textStyle_9_bold(context).copyWith(
            color: primaryDarkGrey,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).push(RoutersManager.kLoginScreen);
          },
          child: Text(
            StringsApp.loginAccount,
            style: StylesManager.textStyle_9_bold(context).copyWith(
              color: primaryGreen,
            ),
          ),
        ),
      ],
    );
  }
}
