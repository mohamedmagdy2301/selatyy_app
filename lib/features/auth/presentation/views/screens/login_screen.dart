import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
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
        bottom: false,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              isKeybordVisible(context)
                  ? const SizedBox(height: 10)
                  : SizedBox(height: context.height * 0.04),
              isKeybordVisible(context)
                  ? const SizedBox(height: 0)
                  : const SectionNameAuthScreen(),
              SizedBox(height: context.height * 0.04),
              const SectionTextFeildLoginScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
