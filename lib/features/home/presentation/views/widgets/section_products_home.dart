import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/screens/all_products_screen.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_products_home.dart';

class SectionMostSellerHome extends StatelessWidget {
  const SectionMostSellerHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.height * .02),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.05,
            vertical: context.width * 0.03,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "منتجات قد تعجبك",
                style: StylesManager.textStyle_30_bold(context),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    withNavBar: true,
                    screen: const AllProductsScreen(),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: Text(
                  "عرض الكل",
                  style: StylesManager.textStyle_14_bold(context).copyWith(
                    color: primaryGreen,
                  ),
                ),
              ),
            ],
          ),
        ),
        const BuildProductsHome(),
      ],
    );
  }
}
