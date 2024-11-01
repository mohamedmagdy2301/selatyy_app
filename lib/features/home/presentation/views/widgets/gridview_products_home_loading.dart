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
    return Skeletonizer(
      effect: shimmerEffect(),
      enabled: true,
      child: SizedBox(
        height: context.height * 0.32,
        child: GridView.builder(
          itemCount: 5,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
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
                            imageUrl: "${kBaseUrlForImage}30.jpg",
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
                          Text("erstdfgsfddجنية"),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon:
                                Icon(CupertinoIcons.cart, color: primaryWhite),
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
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 4.5 / 3.5,
          ),
        ),
      ),
    );
  }
}
