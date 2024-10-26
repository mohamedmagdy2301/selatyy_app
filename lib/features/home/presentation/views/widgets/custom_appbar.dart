import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class CustomAppbarHome {
  static List<Widget> appBarActions(BuildContext context, Function onTap,
      {required name, required address}) {
    return [
      SizedBox(width: context.width * 0.02),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          onTap();
        },
        child: SizedBox(
          width: context.width * 0.08,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl:
                  "https://i.pinimg.com/564x/cd/4b/d9/cd4bd9b0ea2807611ba3a67c331bff0b.jpg",
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) {
                return Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ),
      ),
      SizedBox(width: context.width * 0.02),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "مرحباً $name 👋",
            style: StylesManager.textStyle_10_Medium(context).copyWith(
              color: primaryBlack,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            address,
            style: StylesManager.textStyle_9_Medium(context).copyWith(
              color: primaryDarkGrey,
            ),
          ),
        ],
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          Navigator.pop(context);
        },
        child: const Center(
          child: Icon(
            CupertinoIcons.camera_on_rectangle,
            textDirection: TextDirection.ltr,
            color: primaryDarkGrey,
            size: 20,
          ),
        ),
      ),
      SizedBox(width: context.width * 0.04),
    ];
  }
}
