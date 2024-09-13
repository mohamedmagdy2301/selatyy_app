import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class ItemLogOutProfile extends StatelessWidget {
  const ItemLogOutProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width * 0.35,
      height: context.height * 0.135,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryRed,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.logout,
            color: primaryWhite,
            size: 40,
          ),
          Text(
            "خروج",
            style: StylesManager.textStyle_30_bold(context).copyWith(
              color: primaryWhite,
            ),
          ),
        ],
      ),
    );
  }
}
