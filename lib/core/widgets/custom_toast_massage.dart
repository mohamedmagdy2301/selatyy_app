// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/text_styles.dart';

showToast(context,
    {required String text, required Color color, required IconData icon}) {
  FToast().init(context).showToast(
        gravity: ToastGravity.BOTTOM,
        toastDuration: Duration(seconds: 2),
        child: CustomToastMassage(text: text, color: color, icon: icon),
      );
}

class CustomToastMassage extends StatelessWidget {
  const CustomToastMassage(
      {super.key, required this.text, required this.color, required this.icon});
  final String text;
  final Color color;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: primaryWhite,
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Text(
              text,
              style: StylesManager.textStyle_10_bold(context).copyWith(
                color: primaryWhite,
              ),
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
