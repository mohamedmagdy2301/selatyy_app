import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class SectionResentOtpScreen extends StatelessWidget {
  const SectionResentOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          StringsApp.notReceiveOtp,
          style: StylesManager.textStyle_10_Light(context).copyWith(
            color: primaryDarkGrey,
          ),
        ),
        SizedBox(height: context.height * 0.009),
        GestureDetector(
          onTap: () {},
          child: Text(
            StringsApp.resendOtp,
            textDirection: TextDirection.rtl,
            style: StylesManager.textStyle_10_Light(context).copyWith(
              color: primaryRed,
            ),
          ),
        ),
      ],
    );
  }
}
