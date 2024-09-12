import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class SectionTitleOtpScreen extends StatelessWidget {
  const SectionTitleOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            StringsApp.checkOtp,
            style: StylesManager.textStyle_28_normal(context),
          ),
          Text(StringsApp.descriptionOtp,
              textDirection: TextDirection.rtl,
              style: StylesManager.textStyle_9_Medium(context).copyWith(
                color: primaryGrey,
              )),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
