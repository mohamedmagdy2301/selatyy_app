import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.suffixIcon,
    required this.labelText,
    this.onSubmitted,
    this.iconColor,
    this.isPassword,
  });
  final Icon? suffixIcon;
  final Color? iconColor;
  final String labelText;
  final void Function(String)? onSubmitted;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        border: customOutlineInputBorder(),
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
        suffixIcon: suffixIcon,
        labelText: labelText,
        labelStyle: StylesManager.textStyle_9_Medium(context).copyWith(
          color: primaryGrey,
        ),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: primaryLightGrey),
    );
  }
}
