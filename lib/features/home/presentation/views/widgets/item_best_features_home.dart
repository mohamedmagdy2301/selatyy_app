import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/screens/all_item_feature_screen.dart';

class ItemBestFeaturesHome extends StatelessWidget {
  const ItemBestFeaturesHome(
      {super.key,
      required this.heightImageBackground,
      required this.heightCricleImage});
  final double heightImageBackground, heightCricleImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PersistentNavBarNavigator.pushNewScreen(
          context,
          withNavBar: true,
          screen: AllItemFeatureScreen(),
          pageTransitionAnimation: PageTransitionAnimation.cupertino,
        );
      },
      child: Container(
        width: context.width * 0.15,
        margin: EdgeInsets.symmetric(horizontal: context.width * 0.01),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: primaryWhite,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: context.height * 0.011,
              child: Text("فواكه",
                  style: StylesManager.textStyle_8_Medium(context)
                      .copyWith(color: primaryBlack)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: heightImageBackground * context.height,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/fruits_category.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: context.height * 0.038,
              child: CircleAvatar(
                radius: (heightCricleImage + .005) * context.width,
                backgroundColor: primaryWhite,
                child: CircleAvatar(
                  radius: heightCricleImage * context.width,
                  backgroundColor: secondaryOrange,
                  child: Image.asset(
                    'assets/images/category_icon.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
