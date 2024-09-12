import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class ItemProductHome extends StatelessWidget {
  const ItemProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(RoutersManager.kCartScreen);
      },
      child: Card(
        color: primaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: context.height * 0.01),
                  height: context.height * 0.02,
                  width: context.width * 0.07,
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30),
                    ),
                    color: primaryGreen,
                  ),
                  child: Text(
                    "  جديد",
                    style: StylesManager.textStyle_6_Light(context),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Icon(
                    CupertinoIcons.heart_fill,
                    color: primaryGreen,
                    size: context.height * 0.025,
                  ),
                ),
              ],
            ),
            Center(
              child: Image.asset(
                "assets/images/fruits.png",
                height: context.height * 0.08,
                width: context.width * 0.2,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Container(
                  //   padding:
                  //       EdgeInsets.symmetric(horizontal: context.width * 0.015),
                  //   height: context.height * 0.022,
                  //   alignment: Alignment.centerRight,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(20),
                  //     color: secondaryOrange,
                  //   ),
                  //   child: Text(
                  //     "فواكه",
                  //     style: StylesManager.textStyle_6_Light(context),
                  //   ),
                  // ),
                  // SizedBox(height: context.height * 0.007),
                  Text(
                    "طبق الفواكه الكبيرة",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: StylesManager.textStyle_8_Medium(context).copyWith(
                      color: primaryDarkGrey,
                    ),
                  ),
                  Text(
                    "1 kg",
                    style: StylesManager.textStyle_8_Medium(context).copyWith(
                      color: primaryDarkGrey,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: context.width * 0.02,
                  vertical: context.height * 0.01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  color: primaryGrey,
                ),
                child: Row(
                  children: [
                    Text(
                      "120 EGP",
                      style: StylesManager.textStyle_6_bold(context),
                    ),
                    Spacer(),
                    Icon(
                      CupertinoIcons.shopping_cart,
                      color: primaryRed,
                      size: context.height * 0.025,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}