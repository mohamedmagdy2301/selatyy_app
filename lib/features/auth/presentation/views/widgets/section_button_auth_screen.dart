import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';

class SectionButtonAuthScreen extends StatelessWidget {
  const SectionButtonAuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomButton(
          titleButton: StringsApp.loginAccount,
          colorButton: primaryRed,
          onTap: () {
            GoRouter.of(context).push(RoutersManager.kLoginScreen);
          },
        ),
        SizedBox(height: context.height * 0.02),
        CustomButton(
          titleButton: StringsApp.createAccount,
          colorButton: primaryGreen,
          onTap: () {
            GoRouter.of(context).push(RoutersManager.kRegisterScreen);
          },
        ),
      ],
    );
  }
}
