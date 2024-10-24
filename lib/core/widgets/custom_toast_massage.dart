// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast({required String text, required Color color}) {
  FToast().showToast(
    gravity: ToastGravity.BOTTOM,
    toastDuration: Duration(seconds: 2),
    child: CustomToastMassage(text: text, color: color),
  );
}

class CustomToastMassage extends StatelessWidget {
  const CustomToastMassage(
      {super.key, required this.text, required this.color});
  final String text;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.check),
          SizedBox(
            width: 12.0,
          ),
          Text(text),
        ],
      ),
    );
  }
}
