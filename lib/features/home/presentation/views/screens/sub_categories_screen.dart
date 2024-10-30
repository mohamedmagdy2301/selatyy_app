import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/features/home/data/models/categories_model/sub_cat.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_all_item_features.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_sub_categories_home.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen(
      {super.key, required this.subCategories, required this.title});

  final List<SubCategories> subCategories;
  final String title;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isLandscape = screenSize.width > screenSize.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body: NestedScrollView(
        physics: const NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: screenSize.height * 0.06,
              toolbarHeight: screenSize.height * 0.09,
              backgroundColor: primaryGreen,
              actions:
                  CustomAppbarAllItemFeatures.appBarActions(context, title),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: screenSize.height * 0.02)),
          ];
        },
        body: OrientationBuilder(
          builder: (context, orientation) {
            final double paddingFactor = isLandscape ? 0.2 : 0.06;
            final int crossAxisCount = isLandscape ? 3 : 2;
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: screenSize.height * 0.02,
                horizontal: screenSize.width * paddingFactor,
              ),
              child: GridView.builder(
                itemCount: subCategories.length,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 0.035 * screenSize.width,
                  crossAxisSpacing: 0.02 * screenSize.width,
                  childAspectRatio: isLandscape ? 0.78 : 0.85,
                ),
                itemBuilder: (context, index) {
                  return ItemSubCategoriesHome(
                    product: subCategories[index],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
