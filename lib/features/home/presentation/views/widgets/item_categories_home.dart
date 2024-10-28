import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/data/models/categories_model.dart';
import 'package:selaty/features/home/presentation/views/screens/all_item_feature_screen.dart';

class ItemCategoriesHome extends StatelessWidget {
  const ItemCategoriesHome({super.key, this.categories});
  final Categories? categories;

  @override
  Widget build(BuildContext context) {
    return categories == null
        ? SizedBox()
        : GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                withNavBar: true,
                screen: AllItemFeatureScreen(),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Container(
              width: context.width * 0.25,
              margin: EdgeInsets.symmetric(horizontal: context.width * 0.01),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(
                      "$kBaseUrlForImage${categories!.img ?? ""}"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black.withOpacity(0.6),
                ),
                child: Text(
                  categories!.name ?? "",
                  style: StylesManager.textStyle_9_bold(context)
                      .copyWith(color: primaryWhite),
                ),
              ),
            ),
          );
  }
}
