import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_state.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.width > 600;
    final padding = EdgeInsets.all(context.width * 0.04);
    final titleFontSize = isTablet ? 30.0 : 24.0;
    final detailFontSize = isTablet ? 22.0 : 16.0;
    final sectionSpacing = context.height * 0.02;

    return Scaffold(
      backgroundColor: backGroundScaffold,
      appBar: AppBar(
        centerTitle: true,
        flexibleSpace: Container(color: backGroundScaffold),
        title: Text(
          "تفاصيل المنتج",
          style: StylesManager.textStyle_28_bold(context).copyWith(
            color: primaryBlack,
            fontSize: titleFontSize,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageProductWidget(
              product: product,
              width:
                  context.isLandscape ? context.width * 0.9 : double.infinity,
              height: context.isLandscape
                  ? context.height * 0.3
                  : context.height * 0.5,
            ),
            SizedBox(height: sectionSpacing),
            Text(
              product.name!,
              style: TextStyle(
                fontSize: titleFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: sectionSpacing * 0.5),
            Row(
              children: [
                Text(
                  "${product.price!.split(".").first} جنية",
                  style: StylesManager.textStyle_40_Red_AR(context).copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Spacer(),
                IconFavorite(product: product),
                SizedBox(width: context.width * 0.04),
              ],
            ),
            SizedBox(height: sectionSpacing),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "تفاصيل المنتج",
                  style: TextStyle(
                      fontSize: titleFontSize, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: sectionSpacing * 0.5),
                Text(
                  product.details ?? "لا توجد تفاصيل متاحة.",
                  style: TextStyle(
                      fontSize: detailFontSize, color: Colors.grey[700]),
                ),
                SizedBox(height: sectionSpacing),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

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
        fit: BoxFit.fill,
        width: width,
        height: height,
        imageUrl: product.image!,
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

class IconFavorite extends StatelessWidget {
  const IconFavorite({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    // Determine screen properties for responsiveness
    final isTablet = context.width > 600;
    return BlocConsumer<FavoriteProductCubit, FavoriteProductState>(
      listener: (context, state) {
        if (state is AddFavoriteProductError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.message),
            ),
          );
        }
      },
      builder: (context, state) {
        bool isFavorite = !context
            .read<FavoriteProductCubit>()
            .favoriteProductIds
            .contains(product.id!.toString());
        return IconButton(
          icon: Icon(
            !isFavorite ? Icons.favorite : Icons.favorite_border,
            size: isTablet ? 50 : 40,
            color: !isFavorite ? Colors.red : Colors.grey,
          ),
          onPressed: () {
            context.read<FavoriteProductCubit>().addFavoriteProduct(
                  productId: product.id!,
                );
          },
        );
      },
    );
  }
}
