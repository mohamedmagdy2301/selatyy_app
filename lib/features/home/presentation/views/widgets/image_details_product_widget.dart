import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageProductWidget extends StatelessWidget {
  const ImageProductWidget({
    super.key,
    required this.product,
    required this.height,
    required this.width,
  });

  final ProductEntity product;
  final double height, width;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CachedNetworkImage(
        imageUrl: product.image!,
        height: height,
        width: width,
        fit: BoxFit.fill,
        placeholder: (context, url) {
          return Skeletonizer(
            effect: shimmerEffect(),
            enabled: true,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                kCatagoryImage,
                fit: BoxFit.fill,
              ),
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
    );
  }
}
