import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class EditUserProfile extends StatelessWidget {
  const EditUserProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.4,
      height: context.height * 0.15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryGreen,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.02,
        vertical: context.height * 0.02,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(CupertinoIcons.settings,
              color: primaryWhite, size: context.textScale * 10),
          Text(
            "تعديل البيانات",
            style: StylesManager.textStyle_28_bold(context).copyWith(
              color: primaryWhite,
            ),
          ),
        ],
      ),
    );
  }
}
