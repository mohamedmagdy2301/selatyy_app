import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/data/models/categories_modell/categories.dart';
import 'package:selaty/features/home/presentation/views/screens/sub_categories_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

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
                screen: SubCategoriesScreen(
                  subCategories: categories!.subCat ?? [],
                  title: categories!.name ?? "",
                ),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: context.width * 0.3,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        bottom: 0,
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: "$kBaseUrlForImage${categories!.img}",
                          placeholder: (context, url) {
                            return Skeletonizer(
                              effect: shimmerEffect(),
                              enabled: true,
                              child: Image.asset(
                                kCatagoryImage,
                                fit: BoxFit.fill,
                              ),
                            );
                          },
                          errorWidget: (context, url, error) {
                            return Image.asset(
                              kCatagoryImage,
                              fit: BoxFit.fill,
                            );
                          },
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        height: context.height * 0.05,
                        child: Container(
                          alignment: Alignment.center,
                          color: Colors.black.withOpacity(0.7),
                          child: Text(
                            categories!.name ?? "",
                            style: StylesManager.textStyle_10_bold(context)
                                .copyWith(color: primaryWhite),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
