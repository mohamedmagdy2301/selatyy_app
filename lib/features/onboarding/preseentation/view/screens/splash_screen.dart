import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/constants.dart';
import 'package:selaty_app/core/decoration/decoration.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 9)).then((value) {
      GoRouter.of(context).pushReplacement(RoutersManager.kOnboardingScreen);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation != Orientation.portrait;
    return Scaffold(
      body: Container(
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
                            style: StylesManager.textStyle_40_Red_AR(context),
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
    );
  }
}