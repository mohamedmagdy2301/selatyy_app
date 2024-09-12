import 'package:flutter/material.dart';
import 'package:selaty_app/core/constants.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class SectionNameAuthScreen extends StatelessWidget {
  const SectionNameAuthScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation != Orientation.portrait;
    return isLandscape
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                height: context.height * 0.12,
                width: context.width * 0.25,
                image: const AssetImage(kLogo),
                fit: BoxFit.fill,
              ),
              SizedBox(height: context.height * 0.01),
              Text(
                StringsApp.appNameAr,
                style: StylesManager.textStyle_40_Red_AR(context),
              ),
              SizedBox(height: context.height * 0.008),
              Text(StringsApp.appNameEn,
                  style: StylesManager.textStyle_14_EN(context)),
              SizedBox(height: context.height * 0.01),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    StringsApp.appNameAr,
                    style: StylesManager.textStyle_40_Red_AR(context),
                  ),
                  SizedBox(height: context.height * 0.008),
                  Text(StringsApp.appNameEn,
                      style: StylesManager.textStyle_14_EN(context)),
                  SizedBox(height: context.height * 0.01),
                ],
              ),
              SizedBox(width: context.width * 0.05),
              Image(
                height: context.height * 0.12,
                width: context.width * 0.25,
                image: const AssetImage(kLogo),
                fit: BoxFit.fill,
              ),
            ],
          );
  }
}
