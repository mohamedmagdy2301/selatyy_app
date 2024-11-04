import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:skeletonizer/skeletonizer.dart';

class GridViewProductsHomeLoading extends StatefulWidget {
  const GridViewProductsHomeLoading({
    super.key,
  });

  @override
  State<GridViewProductsHomeLoading> createState() =>
      _GridViewProductsHomeLoadingState();
}

class _GridViewProductsHomeLoadingState
    extends State<GridViewProductsHomeLoading> {
  @override
  Widget build(BuildContext context) {
    final double height = context.width > 600
        ? context.height * 0.34
        : (context.isLandscape)
            ? context.height * .33
            : context.height * 0.31;

    return Skeletonizer(
      effect: shimmerEffect(),
      enabled: true,
      child: SizedBox(
        height: height,
        child: GridView.builder(
          itemCount: 4,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4.5 / 3.7,
          ),
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
                            errorWidget: (context, url, error) {
                              return Skeletonizer(
                                effect: shimmerEffect(),
                                enabled: true,
                                child: Image.asset(
                                  kCatagoryImage,
                                  fit: BoxFit.fill,
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: context.height * 0.006),
                        const Text("oduct!.name!"),
                        SizedBox(height: context.height * .005),
                        const Text("product!.de taijkhkhls!"),
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
                      shape: const RoundedRectangleBorder(
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
                          const Text("erstdfgsfddجنية"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(CupertinoIcons.cart,
                                color: primaryWhite),
                          ),
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
}
