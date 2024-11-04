import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:selaty/features/cart/presentation/view%20model/cart_cubit.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/widgets/icon_favorite_details_widget.dart';
import 'package:selaty/features/home/presentation/views/widgets/image_details_product_widget.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductEntity product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = context.width > 600;
    final padding = EdgeInsets.symmetric(
        horizontal: context.width * 0.04, vertical: context.height * 0.02);
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
                  : context.height * 0.4,
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
                  "${product.price!.toString().split(".").first} جنية",
                  style: StylesManager.textStyle_40_Red_AR(context).copyWith(
                    color: product.quantity == 0 ? Colors.red : primaryGreen,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                product.quantity == 0
                    ? Text("  (غير متوفر)",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 5 * context.textScale,
                          fontWeight: FontWeight.bold,
                        ))
                    : const SizedBox(),
                const Spacer(),
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
                CustomButton(
                  titleButton: product.quantity == 0
                      ? 'غير متوفر'
                      : 'أضافة لعربة التسوق',
                  colorButton:
                      product.quantity == 0 ? Colors.grey : primaryGreen,
                  onTap: () {
                    if (product.quantity == 0) {
                      return;
                    }
                    showQuantityDialog(
                      context,
                      (quantity) => context.read<CartCubit>().addProduct(
                            ProductCart(
                              id: product.id,
                              name: product.name,
                              image: product.image,
                              details: product.details,
                              price: double.parse(product.price!),
                              quantity: quantity,
                            ),
                          ),
                    );
                  },
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
