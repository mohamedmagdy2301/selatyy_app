import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/login/section_text_field_login_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_have_or_nothave_acc.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/title_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_name_auth_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundScaffold,
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: !context.isLandscape,
              floating: context.isLandscape,
              snap: context.isLandscape,
              toolbarHeight: context.height * 0.07,
              title: const AppBarTitleLoginScreen(),
              centerTitle: true,
              flexibleSpace: Container(color: backGroundScaffold),
            ),
          ];
        },
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: context.isLandscape
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: context.width * 0.9,
                          child: const SectionTextFeildLoginScreen()),
                      const SectionNameAuthScreen(),
                      SizedBox(height: context.height * 0.02),
                      const SectionNotHaveAccount(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isKeybordVisible(context)
                          ? SizedBox(height: context.height * 0.04)
                          : const SectionNameAuthScreen(),
                      SizedBox(height: context.height * 0.04),
                      const SectionTextFeildLoginScreen(),
                      SizedBox(height: context.height * 0.02),
                      const SectionNotHaveAccount(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
