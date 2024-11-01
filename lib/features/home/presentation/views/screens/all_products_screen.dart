import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/domain/entities/product_entity.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_all_products.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.products});
  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    bool isTablet = context.width > 600;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(
        toolbarHeight: context.height * .07,
        title: Text(
          "كل المنتجات",
          style: StylesManager.textStyle_28_bold(context).copyWith(
            color: primaryBlack,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isLandscape
              ? context.height * 0.01
              : context.height * 0.02,
          horizontal: isTablet || context.isLandscape
              ? context.width * 0.03
              : context.width * 0.06,
        ),
        child: GridView.builder(
          itemCount: products.length - 1,
          padding: EdgeInsets.zero,
          gridDelegate:
              sliverGridDelegateWithFixedCrossAxisCount(context, isTablet),
          itemBuilder: (context, index) {
            return BuildAllProducts(products: products, index: index + 1);
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
      mainAxisSpacing: 0.04 * context.width,
      crossAxisSpacing: 10,
      childAspectRatio: childAspectRatio,
    );
  }
}
