import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/login/section_text_field_login_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_name_auth_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarAuth(
        iconRight: CupertinoIcons.camera_on_rectangle,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.055),
          child: OrientationBuilder(builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: context.width * 0.8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: context.width * 0.8,
                              child: const SectionTextFeildLoginScreen(),
                            ),
                            SizedBox(height: context.height * 0.002),
                            TextButton(
                              onPressed: () {
                                GoRouter.of(context)
                                    .push(RoutersManager.kChangePasswordScreen);
                              },
                              child: Text(
                                StringsApp.forgetPassword,
                                style: StylesManager.textStyle_8_Medium(context)
                                    .copyWith(
                                  color: primaryDarkGrey,
                                ),
                              ),
                            ),
                            SizedBox(height: context.height * 0.02),
                            CustomButton(
                              colorButton: primaryGreen,
                              titleButton: StringsApp.loginAccount,
                              onTap: () {
                                GoRouter.of(context).pushReplacement(
                                    RoutersManager.kMainScaffoldScreen);
                              },
                            ),
                          ],
                        ),
                      ),
                      const SectionNameAuthScreen(),
                    ],
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isKeybordVisible(context)
                      ? const SizedBox(height: 0)
                      : SizedBox(height: context.height * 0.04),
                  isKeybordVisible(context)
                      ? const SizedBox(height: 0)
                      : const SectionNameAuthScreen(),
                  SizedBox(height: context.height * 0.04),
                  const SectionTextFeildLoginScreen(),
                  SizedBox(height: context.height * 0.015),
                  TextButton(
                    onPressed: () {
                      GoRouter.of(context)
                          .push(RoutersManager.kChangePasswordScreen);
                    },
                    child: Text(
                      StringsApp.forgetPassword,
                      style: StylesManager.textStyle_8_Medium(context).copyWith(
                        color: primaryDarkGrey,
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * 0.035),
                  CustomButton(
                    colorButton: primaryGreen,
                    titleButton: StringsApp.loginAccount,
                    onTap: () {
                      GoRouter.of(context)
                          .pushReplacement(RoutersManager.kMainScaffoldScreen);
                    },
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
