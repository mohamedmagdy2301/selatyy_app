// ignore_for_file: file_names

import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_text_feild.dart';

class SectionTextFeildChangePasswordScreen extends StatelessWidget {
  const SectionTextFeildChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const CustomTextFeild(
          labelText: StringsApp.oldPassword,
          obscureText: true,
          suffixIcon: Icon(
            CupertinoIcons.eye_slash_fill,
            color: primaryDarkGrey,
          ),
        ),
        SizedBox(height: context.height * 0.02),
        const CustomTextFeild(
          labelText: StringsApp.newPassword,
          obscureText: true,
          suffixIcon: Icon(
            CupertinoIcons.eye_slash_fill,
            color: primaryDarkGrey,
          ),
        ),
        SizedBox(height: context.height * 0.009),
      ],
    );
  }
}
