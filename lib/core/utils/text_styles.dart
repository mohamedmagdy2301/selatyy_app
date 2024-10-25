// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';

abstract class StylesManager {
  static TextStyle textStyle_6_Light(BuildContext context) {
    return TextStyle(
      fontSize: 2 * context.textScale,
      fontWeight: FontWeight.w300,
      color: primaryWhite,
    );
  }

  static TextStyle textStyle_6_bold(BuildContext context) {
    return TextStyle(
      fontSize: 1.5 * context.textScale,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle_7_bold(BuildContext context) {
    return TextStyle(
      fontSize: 3 * context.textScale,
      fontWeight: FontWeight.bold,
      color: primaryBlack,
    );
  }

  static TextStyle textStyle_8_Medium(BuildContext context) {
    return TextStyle(
      fontSize: 2.5 * context.textScale,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle_9_Medium(BuildContext context) {
    return TextStyle(
      fontSize: 3 * context.textScale,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle_9_bold(BuildContext context) {
    return TextStyle(
      fontSize: 3 * context.textScale,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle_11_bold(BuildContext context) {
    return TextStyle(
      fontSize: 4 * context.textScale,
      fontWeight: FontWeight.bold,
      color: primaryBlack,
    );
  }

  static TextStyle textStyle_10_Light(BuildContext context) {
    return TextStyle(
      fontSize: 3.5 * context.textScale,
      color: primaryWhite,
      fontWeight: FontWeight.w300,
    );
  }

  static TextStyle textStyle_10_bold(BuildContext context) {
    return TextStyle(
      fontSize: 3.5 * context.textScale,
      color: primaryBlack,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle_10_Medium(BuildContext context) {
    return TextStyle(
      fontSize: 3.5 * context.textScale,
      color: primaryBlack,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle_11_Light(BuildContext context) {
    return TextStyle(
      fontSize: 4 * context.textScale,
      color: primaryDarkGrey,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle textStyle_14_bold(BuildContext context) {
    return TextStyle(
      fontSize: 4.5 * context.textScale,
      fontWeight: FontWeight.bold,
      color: primaryBlack,
    );
  }

  static TextStyle textStyle_14_EN(BuildContext context) {
    return TextStyle(
      color: primaryBlack,
      fontSize: 4.5 * context.textScale,
      fontWeight: FontWeight.w900,
      fontFamily: 'Roboto',
      letterSpacing: 2 * context.textScale,
    );
  }

  static TextStyle textStyle_28_normal(BuildContext context) {
    return TextStyle(
      fontSize: 5 * context.textScale,
      fontWeight: FontWeight.normal,
      color: primaryBlack,
    );
  }

  static TextStyle textStyle_28_bold(BuildContext context) {
    return TextStyle(
      fontSize: 5 * context.textScale,
      fontWeight: FontWeight.bold,
      color: primaryBlack,
    );
  }

  static TextStyle textStyle_30_bold(BuildContext context) {
    return TextStyle(
      fontSize: 6 * context.textScale,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle_40_Red_AR(BuildContext context) {
    return TextStyle(
      color: accentRedText,
      fontSize: 7 * context.textScale,
      fontWeight: FontWeight.bold,
      fontFamily: 'NotoKufiArabic',
    );
  }
}
