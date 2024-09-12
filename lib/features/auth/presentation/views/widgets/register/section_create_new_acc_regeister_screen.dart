import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class SectionCreateNewAccRegeisterScreen extends StatelessWidget {
  const SectionCreateNewAccRegeisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringsApp.createAccountNew,
          style: StylesManager.textStyle_28_normal(context),
        ),
        Text(
          StringsApp.enterYourData,
          textDirection: TextDirection.rtl,
          style: StylesManager.textStyle_9_Medium(context).copyWith(
            color: primaryGrey,
          ),
        ),
        SizedBox(height: context.height * 0.03),
      ],
    );
  }
}
