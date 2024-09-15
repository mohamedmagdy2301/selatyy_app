import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/auth/presentation/views/widgets/change_password/section_textfeild%20_change_password_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/change_password/section_title_change_password_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/custom_appbar.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppbarAuth(
        iconRight: CupertinoIcons.camera_on_rectangle,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
          child: SingleChildScrollView(
            child: Center(
              child: SizedBox(
                width: context.width * 0.9,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: context.height * 0.01),
                    const SectionTitleChangePasseordScreen(),
                    SizedBox(height: context.height * 0.02),
                    const SectionTextFeildChangePasswordScreen(),
                    SizedBox(height: context.height * 0.04),
                    CustomButton(
                      colorButton: primaryGreen,
                      titleButton: StringsApp.change,
                      onTap: () {
                        GoRouter.of(context).push(RoutersManager.kOtpScreen);
                      },
                    ),
                    SizedBox(height: context.height * 0.05),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
