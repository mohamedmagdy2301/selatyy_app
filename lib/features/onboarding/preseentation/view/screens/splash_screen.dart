// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/auth/presentation/view_model/is_logged_in_cubit/is_logged_in_cubit.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation != Orientation.portrait;

    return BlocListener<IsLoggedInCubit, IsLoggedInState>(
      listener: (context, state) {
        Future.delayed(const Duration(seconds: 3), () {
          if (SharedPreferencesManager.getData(key: isFisrtKey) ?? true) {
            GoRouter.of(context)
                .pushReplacement(RoutersManager.kOnboardingScreen);
          } else {
            if (state is UnAuthenticatedState) {
              GoRouter.of(context).pushReplacement(RoutersManager.kAuthScreen);
            } else {
              GoRouter.of(context)
                  .pushReplacement(RoutersManager.kMainScaffoldScreen);
            }
          }
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: isLandscape ? context.height : context.width,
            height: isLandscape ? context.width : context.height,
            decoration: kBackgroundDecoration,
            child: isLandscape
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                StringsApp.appNameAr,
                                style:
                                    StylesManager.textStyle_40_Red_AR(context),
                              ),
                              SizedBox(height: context.height * 0.008),
                              Text(
                                StringsApp.appNameEn,
                                style: StylesManager.textStyle_14_EN(context),
                              ),
                            ],
                          ),
                          Image.asset(
                            kLogo,
                            height: context.width * 0.45,
                            width: context.width * 0.45,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      SizedBox(height: context.height * 0.05),
                      Image.asset(
                        kLoadingGif,
                        height: context.width * 0.14,
                        width: context.width * 0.14,
                        fit: BoxFit.fill,
                      )
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        kLogo,
                        height: context.width * 0.45,
                        width: context.width * 0.45,
                        fit: BoxFit.fill,
                      ),
                      SizedBox(height: context.height * 0.002),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            StringsApp.appNameAr,
                            style: StylesManager.textStyle_40_Red_AR(context),
                          ),
                          SizedBox(height: context.height * 0.008),
                          Text(StringsApp.appNameEn,
                              style: StylesManager.textStyle_14_EN(context)),
                        ],
                      ),
                      SizedBox(height: context.height * 0.05),
                      Image.asset(
                        kLoadingGif,
                        height: context.width * 0.14,
                        width: context.width * 0.14,
                        fit: BoxFit.fill,
                      )
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
