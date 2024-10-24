import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_already_have_acc.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 10,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionCreateNewAccRegeisterScreen(),

              SectionTextFeildRegister(),
              SizedBox(height: context.height * 0.01),
              const SectionAlreadyHaveAccount(),
              // SizedBox(height: context.height * 0.01),
              // const SectionButtonSocialRegister(),
            ],
          ),
        ),
      ),
    );
  }
}
