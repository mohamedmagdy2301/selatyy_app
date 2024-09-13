import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class ItemCenterHelpProfile extends StatelessWidget {
  const ItemCenterHelpProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.38,
      height: context.height * 0.135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryGreen,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            CupertinoIcons.hammer_fill,
            color: primaryWhite,
            size: 40,
          ),
          Text(
            "مركز المساعدة",
            style: StylesManager.textStyle_28_bold(context).copyWith(
              color: primaryWhite,
            ),
          ),
        ],
      ),
    );
  }
}
