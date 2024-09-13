import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_already_have_acc.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_button_register.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_create_new_acc_regeister_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_text_field_regeister_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbarAuth(
        iconRight: CupertinoIcons.camera_on_rectangle,
      ),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Center(
                  child: SizedBox(
                    width: context.width * 0.7,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SectionCreateNewAccRegeisterScreen(),
                        const SectionTextFeildRegister(),
                        SizedBox(height: context.height * 0.03),
                        CustomButton(
                          titleButton: StringsApp.submitRegister,
                          colorButton: primaryGreen,
                          onTap: () {
                            GoRouter.of(context).pushReplacement(
                                RoutersManager.kMainScaffoldScreen);
                          },
                        ),
                        SizedBox(height: context.height * 0.007),
                        const SectionAlreadyHaveAccount(),
                        SizedBox(height: context.height * 0.03),
                        const SectionButtonSocialRegister(),
                        SizedBox(height: context.height * 0.01),
                      ],
                    ),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: context.width * 0.055),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SectionCreateNewAccRegeisterScreen(),
                    const SectionTextFeildRegister(),
                    SizedBox(height: context.height * 0.04),
                    CustomButton(
                      titleButton: StringsApp.submitRegister,
                      colorButton: primaryGreen,
                      onTap: () {
                        GoRouter.of(context).pushReplacement(
                            RoutersManager.kMainScaffoldScreen);
                      },
                    ),
                    SizedBox(height: context.height * 0.01),
                    const SectionAlreadyHaveAccount(),
                    SizedBox(height: context.height * 0.03),
                    const SectionButtonSocialRegister(),
                    SizedBox(height: context.height * 0.01),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
