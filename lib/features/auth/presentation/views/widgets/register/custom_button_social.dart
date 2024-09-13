import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomButtonSocial extends StatelessWidget {
  const CustomButtonSocial(
      {super.key,
      required this.icon,
      required this.color,
      required this.title});

  final String icon, title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.045,
      width: context.width * 0.31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: primaryWhite,
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: StylesManager.textStyle_10_Light(context).copyWith(
              color: color,
            ),
          ),
          SizedBox(width: context.width * 0.026),
          Image.asset(
            icon,
            width: context.height * 0.026,
            height: context.height * 0.026,
            fit: BoxFit.fill,
          ),
        ],
      ),
    );
  }
}
