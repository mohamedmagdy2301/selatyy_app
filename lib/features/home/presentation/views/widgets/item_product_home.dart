import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:selaty/features/cart/presentation/view%20model/cart_cubit.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/screens/details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemProductHome extends StatefulWidget {
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
  State<ItemProductHome> createState() => _ItemProductHomeState();
}

class _ItemProductHomeState extends State<ItemProductHome> {
  int click = 0;

  @override
  Widget build(BuildContext context) {
    final double height = context.width > 600
        ? context.height * 0.25
        : (context.isLandscape)
            ? context.height * .24
            : context.height * .225;
    final double width =
        context.width > 600 ? context.width * 0.028 : context.width * 0.035;
    final double sizeIcon =
        context.width > 600 ? 6 * context.textScale : 8.5 * context.textScale;

    return widget.product == null
        ? const SizedBox()
        : GestureDetector(
            onTap: () {
              PersistentNavBarNavigator.pushNewScreen(
                context,
                withNavBar: true,
                screen: ProductDetailsScreen(product: widget.product!),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Center(
                          child: CachedNetworkImage(
                            fit: BoxFit.contain,
                            width: context.width * 0.45,
                            height: context.isLandscape
                                ? context.height * 0.1
                                : context.height * 0.13,
                            imageUrl: widget.product!.image!,
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
                        SizedBox(height: context.height * 0.008),
                        Text(
                          widget.product!.name!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style:
                              StylesManager.textStyle_11_bold(context).copyWith(
                            color: primaryBlack,
                          ),
                        ),
                        SizedBox(height: context.height * .003),
                        widget.product!.quantity == 0
                            ? Text(
                                "غير متوفر",
                                style: StylesManager.textStyle_10_bold(context)
                                    .copyWith(
                                  color: primaryRed,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              )
                            : Text(
                                "متبقى ${widget.product!.quantity} عناصر",
                                style: StylesManager.textStyle_10_bold(context)
                                    .copyWith(
                                  color: primaryGreen,
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
                          Text(
                            "${widget.product?.price!.split(".").first ?? ""} جنية",
                            style: StylesManager.textStyle_14_bold(context)
                                .copyWith(
                              color: primaryWhite,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              if (widget.product!.quantity == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("هذا المنتج غير متوفر"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                              }
                              showQuantityDialog(
                                context,
                                (quantity) =>
                                    context.read<CartCubit>().addProduct(
                                          ProductCart(
                                            id: widget.product!.id,
                                            name: widget.product!.name,
                                            image: widget.product!.image,
                                            details: widget.product!.details,
                                            price: double.parse(
                                                widget.product!.price!),
                                            quantity: quantity,
                                          ),
                                        ),
                              );
                            },
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
                      onPressed: widget.onFavorite,
                      icon: Icon(
                        !widget.isFavorite
                            ? CupertinoIcons.heart
                            : CupertinoIcons.heart_fill,
                        color: !widget.isFavorite ? primaryGrey : primaryRed,
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
