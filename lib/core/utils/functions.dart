import 'package:flutter/material.dart';

hideKeybourd() {
  FocusManager.instance.primaryFocus?.unfocus();
}

bool isKeybordVisible(BuildContext context) {
  // return WidgetsBinding.instance.window.viewInsets.bottom > 0.0 ? true : false;
  return MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
}
