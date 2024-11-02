import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/screens/details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemProductHome extends StatelessWidget {
  const ItemProductHome({
    super.key,
    required this.product,
    required this.isFavorite,
    required this.onFavorite,
    required this.products,
  });
  final ProductEntity? product;
  final Set<ProductEntity> products;

  final bool isFavorite;
  final void Function() onFavorite;

  @override
  Widget build(BuildContext context) {
    final double height = context.width > 600
        ? context.height * 0.25
        : (context.isLandscape)
            ? context.height * .24
            : context.height * .22;
    final double width =
        context.width > 600 ? context.width * 0.028 : context.width * 0.035;
    final double sizeIcon =
        context.width > 600 ? 6 * context.textScale : 8.5 * context.textScale;

    return product == null
        ? SizedBox()
        : GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                withNavBar: true,
                screen: ProductDetailsScreen(product: product!),
                pageTransitionAnimation: PageTransitionAnimation.cupertino,
              );
            },
            child: Card(
              color: primaryWhite,
              child: Stack(
                children: [
                  Positioned(
                    top: context.height * 0.01,
                    left: width,
                    right: width,
                    height: height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: context.width * 0.4,
                            height: context.height * 0.115,
                            imageUrl: product!.image!,
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
                                      StylesManager.textStyle_11_bold(context)
                                          .copyWith(
                                    color:
                                        const Color.fromARGB(113, 54, 54, 54),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: context.height * 0.01),
                        Text(
                          product!.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              StylesManager.textStyle_11_bold(context).copyWith(
                            color: primaryBlack,
                          ),
                        ),
                        SizedBox(height: context.height * .005),
                        Text(
                          product!.details!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: StylesManager.textStyle_8_Medium(context)
                              .copyWith(
                            color: const Color.fromARGB(213, 81, 81, 81),
                          ),
                        ),
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
                          Text(
                            "${product?.price!.split(".").first ?? ""} جنية",
                            style: StylesManager.textStyle_14_bold(context)
                                .copyWith(
                              color: primaryWhite,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              CupertinoIcons.cart,
                              color: primaryWhite,
                              size: sizeIcon,
                            ),
                          ),
                          SizedBox(width: context.width * 0.02),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: .005 * context.height,
                    left: .1,
                    child: IconButton(
                      onPressed: onFavorite,
                      icon: Icon(
                        !isFavorite
                            ? CupertinoIcons.heart
                            : CupertinoIcons.heart_fill,
                        color: !isFavorite ? primaryGrey : primaryRed,
                        size: sizeIcon,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
