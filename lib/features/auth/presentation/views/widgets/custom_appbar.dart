import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';

class CustomAppbarAuth extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbarAuth({super.key, required this.iconRight});
  final IconData iconRight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: context.height * 0.045,
        bottom: context.height * 0.01,
        right: context.width * 0.05,
        left: context.width * 0.05,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              height: context.height * 0.045,
              width: context.height * 0.045,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: primaryLightGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                iconRight,
                color: primaryDarkGrey,
                size: 16,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              hideKeybourd();
              Navigator.pop(context);
            },
            child: Container(
              height: context.height * 0.045,
              width: context.height * 0.045,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: primaryLightGrey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Icon(
                  CupertinoIcons.back,
                  textDirection: TextDirection.ltr,
                  color: primaryDarkGrey,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);
}
