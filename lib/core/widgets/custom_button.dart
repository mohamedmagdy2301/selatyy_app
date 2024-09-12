import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.borderRadius,
    required this.titleButton,
    this.colorButton,
    this.onTap,
    this.colorTitleButton,
  });
  final BorderRadiusGeometry? borderRadius;
  final Color? colorButton, colorTitleButton;
  final String titleButton;

  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          alignment: Alignment.center,
          width: context.width * 0.9,
          height: context.height * 0.06,
          decoration: BoxDecoration(
            color: colorButton,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            titleButton,
            textAlign: TextAlign.center,
            style: StylesManager.textStyle_10_Light(context).copyWith(
              color: colorTitleButton,
            ),
          ),
        ),
      ),
    );
  }
}
