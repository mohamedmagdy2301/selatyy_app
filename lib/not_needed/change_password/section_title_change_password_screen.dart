import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class SectionTitleChangePasseordScreen extends StatelessWidget {
  const SectionTitleChangePasseordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            StringsApp.changePassword,
            style: StylesManager.textStyle_28_normal(context),
          ),
          Text(
            StringsApp.enterNewPassword,
            textDirection: TextDirection.rtl,
            style: StylesManager.textStyle_8_Medium(context).copyWith(
              color: primaryGrey,
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
