import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';

class CustomTextFieldSearch extends StatelessWidget {
  const CustomTextFieldSearch({
    super.key,
    this.onSubmitted,
  });
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: "البحث عن منتجاتك ...",
        filled: true,
        fillColor: primaryWhite,
        border: customOutlineInputBorder(),
        enabledBorder: customOutlineInputBorder(),
        focusedBorder: customOutlineInputBorder(),
        hintStyle: const TextStyle(color: primaryDarkGrey),
        contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        suffixIcon: const Icon(Icons.search, color: primaryDarkGrey),
      ),
    );
  }

  OutlineInputBorder customOutlineInputBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
      borderSide: BorderSide(color: Colors.transparent),
    );
  }
}
