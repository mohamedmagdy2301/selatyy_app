import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/view%20model/favorite_product_cubit/favorite_product_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_body_favorite_products_screen.dart';

class BodyFavoriteProductsScreen extends StatelessWidget {
  const BodyFavoriteProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProductsList =
        context.read<FavoriteProductCubit>().favoriteProductsList;
    bool isTablet = context.width > 600;

    return favoriteProductsList.isEmpty
        ? const NoItemBodyProductScreen(
            text: "لا توجد منتجات في المفضلة",
            icon: CupertinoIcons.heart_slash,
          )
        : Padding(
            padding: EdgeInsets.symmetric(
              vertical: context.isLandscape
                  ? context.height * 0.01
                  : context.height * 0.02,
              horizontal: isTablet || context.isLandscape
                  ? context.width * 0.03
                  : context.width * 0.06,
            ),
            child: GridView.builder(
              itemCount: favoriteProductsList.length,
              padding: EdgeInsets.zero,
              gridDelegate:
                  sliverGridDelegateWithFixedCrossAxisCount(context, isTablet),
              itemBuilder: (context, index) {
                return ItemBodyFavoriteProductsScreen(
                  favoriteProductsList: favoriteProductsList[index].product!,
                );
              },
            ),
          );
  }

  SliverGridDelegateWithFixedCrossAxisCount
      sliverGridDelegateWithFixedCrossAxisCount(
          BuildContext context, bool isTablet) {
    int crossAxisCount = context.isLandscape ? (isTablet ? 4 : 3) : 2;

    double childAspectRatio = context.isLandscape
        ? (isTablet ? 4.5 / 6.5 : 4.4 / 4.7)
        : (isTablet ? 4 / 4.6 : 4 / 6.3);

    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 0.04 * context.width,
      crossAxisSpacing: 10,
      childAspectRatio: childAspectRatio,
    );
  }
}

class NoItemBodyProductScreen extends StatelessWidget {
  const NoItemBodyProductScreen({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: context.isLandscape
                ? context.textScale * 30
                : context.textScale * 50,
            color: primaryLightGrey,
          ),
          SizedBox(height: context.height * .03),
          Text(
            text,
            textAlign: TextAlign.center,
            style: StylesManager.textStyle_28_bold(context).copyWith(
              color: const Color.fromARGB(255, 175, 175, 175),
            ),
          ),
        ],
      ),
    );
  }
}
