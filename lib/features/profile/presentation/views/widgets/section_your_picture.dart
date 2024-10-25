import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class SectionYourPicture extends StatelessWidget {
  const SectionYourPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  height: .16 * context.width,
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
                Container(
                  width: context.width * 0.84,
                  height: .18 * context.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    color: primaryGreen,
                  ),
                ),
              ],
            ),
            Container(
              width: context.width * 0.84,
              padding: EdgeInsets.zero,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: primaryGreen,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "محمد مجدي ",
                    style: StylesManager.textStyle_30_bold(context).copyWith(
                      color: primaryWhite,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: context.height * 0.008),
                  Text(
                    "mohammedmego15@gmail.com",
                    style: StylesManager.textStyle_11_Light(context).copyWith(
                      color: primaryWhite,
                    ),
                  ),
                  SizedBox(height: context.height * 0.018),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          child: Container(
            width: .31 * context.width,
            height: .31 * context.width,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromARGB(255, 238, 238, 238),
            ),
            child: ClipOval(
              child: Image.asset(
                'assets/images/profile.png',
                width: .28 * context.width,
                height: .28 * context.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
