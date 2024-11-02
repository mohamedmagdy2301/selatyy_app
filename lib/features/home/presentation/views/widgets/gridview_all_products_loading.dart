import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewAllProductsLoading extends StatefulWidget {
  const GridViewAllProductsLoading({
    super.key,
  });

  @override
  State<GridViewAllProductsLoading> createState() =>
      _GridViewAllProductsLoadingState();
}

class _GridViewAllProductsLoadingState
    extends State<GridViewAllProductsLoading> {
  @override
  Widget build(BuildContext context) {
    bool isTablet = context.width > 600;

    return Skeletonizer(
      effect: shimmerEffect(),
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 0.015 * context.height,
          horizontal: 0.03 * context.width,
        ),
        child: GridView.builder(
          itemCount: 6,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          gridDelegate:
              sliverGridDelegateWithFixedCrossAxisCount(context, isTablet),
          itemBuilder: (context, index) {
            return Card(
              color: primaryWhite,
              child: Stack(
                children: [
                  Positioned(
                    top: context.height * 0.01,
                    left: context.width * 0.028,
                    right: context.width * 0.028,
                    height: context.height * 0.23,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: context.width * 0.4,
                            height: context.height * 0.115,
                            imageUrl:
                                "${kBaseUrlForImage}2024_08_12_11_46_14_sryr.jpg",
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
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: context.height * 0.006),
                        Text("oduct!.name!"),
                        SizedBox(height: context.height * .005),
                        Text("product!.de taijkhkhls!"),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: context.height * 0.058,
                    child: Card(
                      color: const Color.fromARGB(184, 98, 98, 98),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      margin: EdgeInsets.zero,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: context.width * 0.03),
                          Text("erstdfgsfdd جنية"),
                          Spacer(),
                          Icon(CupertinoIcons.cart, color: primaryWhite),
                          SizedBox(width: context.width * 0.02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  SliverGridDelegateWithFixedCrossAxisCount
      sliverGridDelegateWithFixedCrossAxisCount(
          BuildContext context, bool isTablet) {
    int crossAxisCount = context.isLandscape ? (isTablet ? 4 : 3) : 2;

    double childAspectRatio = context.isLandscape
        ? (isTablet ? 4.5 / 6.4 : 4.4 / 4.5)
        : (isTablet ? 4 / 4.7 : 4 / 6.3);

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 0.02 * context.height,
      crossAxisSpacing: 0.03 * context.width,
      childAspectRatio: childAspectRatio,
    );
  }
}
