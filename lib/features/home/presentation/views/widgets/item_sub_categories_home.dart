import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/data/models/categories_model/sub_cat.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemSubCategoriesHome extends StatelessWidget {
  const ItemSubCategoriesHome({super.key, this.product});
  final SubCategories? product;

  @override
  Widget build(BuildContext context) {
    final double width =
        context.width > 600 ? context.width * 0.25 : context.width * 0.32;
    return product == null
        ? SizedBox()
        : Card(
            color: primaryWhite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: context.height * .01),
                Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.fill,
                    height: context.height * 0.12,
                    width: width,
                    imageUrl: product!.imageSubCategory,
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
                      return Center(
                        child: Text(
                          "لا يوجد صوره لهذا المنتج",
                          textAlign: TextAlign.center,
                          style:
                              StylesManager.textStyle_11_bold(context).copyWith(
                            color: const Color.fromARGB(113, 54, 54, 54),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: context.height * .005),
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
                      SizedBox(height: context.height * .005),
                      Text(
                        product?.details.toString() ?? "",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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
