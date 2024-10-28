import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/custom_button_social.dart';

class SectionButtonSocialRegister extends StatelessWidget {
  const SectionButtonSocialRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "او اشترك مع",
          style: StylesManager.textStyle_9_Medium(context).copyWith(
            color: primaryDarkGrey,
          ),
        ),
        SizedBox(height: context.height * 0.025),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const CustomButtonSocial(
              title: StringsApp.facebook,
              icon: kFacebook,
              color: primaryBlue,
            ),
            const CustomButtonSocial(
              title: StringsApp.google,
              icon: kGoogle,
              color: primaryRed,
            ),
          ],
        ),
      ],
    );
  }
}
