import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CustomAppbarHome {
  static List<Widget> appBarActions(BuildContext context, Function onTap,
      {required name, required address, required image}) {
    return [
      SizedBox(width: context.width * 0.02),
      GestureDetector(
        onTap: () {
          hideKeybourd();
          onTap();
        },
        child: ClipOval(
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            width: context.width * 0.11,
            placeholder: (context, url) {
              return Skeletonizer(
                enabled: true,
                effect: ShimmerEffect(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.grey.shade200,
                  duration: Duration(seconds: 1),
                ),
                child: Image.asset(
                  kAvatarImageUrl,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(
                kAvatarImageUrl,
              );
            },
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
            style: StylesManager.textStyle_14_bold(context).copyWith(
              color: primaryBlack,
              fontWeight: FontWeight.w900,
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
