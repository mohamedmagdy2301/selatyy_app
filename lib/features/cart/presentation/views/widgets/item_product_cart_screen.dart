import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ItemProductCartScreen extends StatefulWidget {
  const ItemProductCartScreen({super.key, required this.productCart});
  final ProductCart productCart;
  @override
  State<ItemProductCartScreen> createState() => _ItemProductCartScreenState();
}

class _ItemProductCartScreenState extends State<ItemProductCartScreen> {
  Color colorIConMinus = primaryBlack;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height > 700 ? context.height * .18 : context.height * .2,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * .03,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: primaryWhite,
      ),
      margin: EdgeInsets.only(
        right: context.width * .04,
        top: context.height * .015,
        left: context.isLandscape ? 0 : context.width * .04,
      ),
      child: Row(
        children: [
          SizedBox(
            width: context.width * .5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: context.height * .01),
                Text(
                  widget.productCart.name!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: StylesManager.textStyle_11_bold(context)
                      .copyWith(color: primaryBlack),
                ),
                Text(
                  widget.productCart.details!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesManager.textStyle_9_Medium(context)
                      .copyWith(color: primaryDarkGrey),
                ),
                Text(
                  "${widget.productCart.quantity} × ${widget.productCart.price} جنيه",
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: StylesManager.textStyle_14_bold(context)
                      .copyWith(color: primaryGreen),
                ),
                SizedBox(height: context.height * .01),
              ],
            ),
          ),
          const Spacer(),
          CachedNetworkImage(
            imageUrl: widget.productCart.image!,
            width: context.width * .3,
            fit: BoxFit.fitHeight,
            placeholder: (context, url) {
              return Skeletonizer(
                effect: shimmerEffect(),
                enabled: true,
                child: Image.asset(
                  kCatagoryImage,
                  fit: BoxFit.fitHeight,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Center(
                child: Text(
                  "لا يوجد صوره لهذا المنتج",
                  textAlign: TextAlign.center,
                  style: StylesManager.textStyle_30_bold(context).copyWith(
                    color: const Color.fromARGB(113, 54, 54, 54),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}







  // SizedBox(
              //   width: context.width * .18,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       IconButton(
              //         padding: EdgeInsets.zero,
              //         icon: Icon(
              //           CupertinoIcons.add,
              //           size: .03 * context.height,
              //         ),
              //         onPressed: () {
              //           setState(() {
              //             widget.productCart[index].quantity ;
              //           });
              //         },
              //       ),
              //       // Padding(
              //       //   padding: EdgeInsets.symmetric(
              //       //       horizontal: context.width * .02),
              //       //   child: Text(
              //       //     "4",
              //       //     style: StylesManager.textStyle_11_bold(context),
              //       //   ),
              //       // ),
              //       IconButton(
              //         padding: EdgeInsets.zero,
              //         icon: Icon(
              //           CupertinoIcons.minus,
              //           size: .03 * context.height,
              //         ),
              //         color: colorIConMinus,
              //         onPressed: () {
              //           setState(() {
              //             setState(() {
              //               if (counts[index] > 1) counts[index]--;
              //             });
              //           });
              //         },
              //       ),
              //     ],
              //   ),     
              // ),