import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/section_text_field_regeister_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/title_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_have_or_nothave_acc.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_name_auth_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
              title: const AppBarTitleRegeisterScreen(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        width: context.width * 0.9,
                        child: const SectionTextFeildRegister(),
                      ),
                      const SectionNameAuthScreen(),
                      SizedBox(height: context.height * 0.02),
                      const SectionAlreadyHaveAccount(),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      isKeyboardVisible(context)
                          ? const SizedBox(height: 0)
                          : const SectionNameAuthScreen(),
                      SizedBox(height: context.height * 0.04),
                      const SectionTextFeildRegister(),
                      SizedBox(height: context.height * 0.02),
                      const SectionAlreadyHaveAccount(),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
