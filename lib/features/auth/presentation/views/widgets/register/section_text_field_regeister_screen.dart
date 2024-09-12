import 'package:flutter/cupertino.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/widgets/custom_text_feild.dart';

class SectionTextFeildRegister extends StatelessWidget {
  const SectionTextFeildRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextFeild(
          labelText: StringsApp.nameUser,
        ),
        SizedBox(height: context.height * 0.018),
        const CustomTextFeild(
          labelText: StringsApp.email,
          suffixIcon: Icon(
            CupertinoIcons.check_mark_circled,
            color: primaryGreen,
          ),
        ),
        SizedBox(height: context.height * 0.018),
        const CustomTextFeild(
          labelText: StringsApp.password,
          isPassword: true,
          suffixIcon: Icon(
            CupertinoIcons.eye_slash_fill,
            color: primaryDarkGrey,
          ),
        ),
      ],
    );
  }
}
