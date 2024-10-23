import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.suffixIcon,
    required this.labelText,
    this.onSaved,
    this.iconColor,
    required this.obscureText,
  });
  final Icon? suffixIcon;
  final Color? iconColor;
  final String labelText;
  final Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Field is required";
        }
        return null;
      },
      onSaved: onSaved,
      obscureText: obscureText,
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
