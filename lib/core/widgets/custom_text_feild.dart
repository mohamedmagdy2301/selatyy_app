import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.suffixIcon,
    required this.labelText,
    this.controller,
    this.iconColor,
    this.obscureText,
    this.keyboardType,
  });
  final Widget? suffixIcon;
  final Color? iconColor;
  final String labelText;
  final TextEditingController? controller;
  final bool? obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType ?? TextInputType.text,
      controller: controller,
      validator: (value) {
        if (value == '') {
          return "$labelText مطلوب";
        }
        return null;
      },
      obscureText: obscureText ?? false,
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
