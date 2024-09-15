import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class ItemGridviewProfile extends StatelessWidget {
  const ItemGridviewProfile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryWhite,
      ),
      child: Text(
        "عني",
        style: StylesManager.textStyle_30_bold(context),
      ),
    );
  }
}
