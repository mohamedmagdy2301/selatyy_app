import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/cart/presentation/views/screens/cart_screen.dart';

class ItemProductHome extends StatelessWidget {
  const ItemProductHome({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          screen: CartScreen(),
          withNavBar: true,
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Card(
        color: primaryWhite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
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
            Spacer(),
            Center(
              child: Image.asset(
                "assets/images/fruits.png",
                height: context.height * 0.08,
                width: context.width * 0.2,
                fit: BoxFit.fill,
              ),
            ),
            Spacer(),
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
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.width * 0.02,
                vertical: context.height * 0.005,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                color: Colors.grey[200],
              ),
              child: Row(
                children: [
                  Text(
                    "120 EGP",
                    style: StylesManager.textStyle_7_bold(context),
                  ),
                  Spacer(),
                  Icon(
                    CupertinoIcons.shopping_cart,
                    color: primaryRed,
                    size: context.height * 0.025,
                  ),

                  // Container(
                  //   height: context.height * 0.0,
                  //   width: double.infinity,
                  //   padding: EdgeInsets.symmetric(
                  //     horizontal: context.width * 0.02,
                  //     vertical: context.height * 0.01,
                  //   ),
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       bottomLeft: Radius.circular(10),
                  //       bottomRight: Radius.circular(10),
                  //     ),
                  //     color: Colors.grey[200],
                  //   ),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         "120 EGP",
                  //         style: StylesManager.textStyle_7_bold(context),
                  //       ),
                  //       Spacer(),
                  //       Icon(
                  //         CupertinoIcons.shopping_cart,
                  //         color: primaryRed,
                  //         size: context.height * 0.025,
                  //       ),
                  //     ],
                  //   ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
