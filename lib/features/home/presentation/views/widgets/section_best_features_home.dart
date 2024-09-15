import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/screens/all_features_screen.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_best_features_home.dart';

class SectionBestFeaturesHome extends StatelessWidget {
  const SectionBestFeaturesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: context.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "التصنيفات",
                style: StylesManager.textStyle_11_bold(context),
              ),
              TextButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    withNavBar: true,
                    screen: AllFeaturesScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text(
                  " << عرض الكل",
                  style: StylesManager.textStyle_9_Medium(context).copyWith(
                    color: primaryDarkGrey,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.height * 0.11,
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemBestFeaturesHome(
                heightImageBackground: .045,
                heightCricleImage: 0.035,
              );
            },
          ),
        ),
      ],
    );
  }
}
