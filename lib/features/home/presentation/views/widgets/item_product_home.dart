import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/data/models/categories_modell/sub_cat.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemSubCategoriesHome extends StatelessWidget {
  const ItemSubCategoriesHome({super.key, this.product});
  final SubCategories? product;

  @override
  Widget build(BuildContext context) {
    return product == null
        ? SizedBox()
        : Card(
            color: primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: context.height * 0.1,
                    width: context.width * 0.35,
                    imageUrl: product!.imageSubCategory,
                    placeholder: (context, url) => Skeletonizer(
                        effect: shimmerEffect(),
                        enabled: true,
                        child: SizedBox(
                          height: context.height * 0.1,
                          width: context.width * 0.35,
                        )),
                    errorWidget: (context, url, error) => Skeletonizer(
                        effect: shimmerEffect(),
                        enabled: true,
                        child: SizedBox(
                          height: context.height * 0.1,
                          width: context.width * 0.35,
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product!.nameSubCategory,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style:
                            StylesManager.textStyle_11_bold(context).copyWith(
                          color: primaryBlack,
                        ),
                      ),
                      Text(
                        product?.details.toString() ?? "",
                        style:
                            StylesManager.textStyle_8_Medium(context).copyWith(
                          color: primaryDarkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }
}
