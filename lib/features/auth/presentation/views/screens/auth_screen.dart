import 'package:flutter/material.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_button_auth_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/section_name_auth_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            bool isLandscape = orientation == Orientation.landscape;
            return Container(
              width: isLandscape ? context.height : context.width,
              height: isLandscape ? context.width : context.height,
              padding: EdgeInsets.symmetric(horizontal: context.width * 0.035),
              decoration: kBackgroundDecoration,
              child: isLandscape
                  ? Center(
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SectionButtonAuthScreen(),
                            SectionNameAuthScreen(),
                          ],
                        ),
                      ),
                    )
                  : SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: context.height * 0.35),
                          const SectionNameAuthScreen(),
                          SizedBox(height: context.height * 0.035),
                          const SectionButtonAuthScreen(),
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
