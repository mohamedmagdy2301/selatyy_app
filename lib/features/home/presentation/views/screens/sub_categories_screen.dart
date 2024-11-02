import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/data/models/categories_model/sub_cat.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_sub_categories_home.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen(
      {super.key, required this.subCategories, required this.title});

  final List<SubCategories> subCategories;
  final String title;

  @override
  Widget build(BuildContext context) {
    final double paddingFactor = context.width > 600
        ? (context.isLandscape ? 0.08 : 0.05)
        : (context.isLandscape ? 0.1 : 0.06);
    final int crossAxisCount = context.width > 600
        ? (context.isLandscape ? 4 : 3)
        : (context.isLandscape ? 4 : 2);

    final double childAspectRatio = context.width > 600
        ? (context.isLandscape ? 0.75 : 0.7)
        : (context.isLandscape ? 0.9 : 0.85);

    return Scaffold(
      backgroundColor: backGroundScaffold,
      appBar: AppBar(
        flexibleSpace: Container(color: backGroundScaffold),
        toolbarHeight: context.height * 0.08,
        title: Text(
          title,
          style: StylesManager.textStyle_40_Red_AR(context)
              .copyWith(color: primaryBlack),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: context.isLandscape
              ? context.height * .01
              : context.height * 0.02,
          horizontal: context.width * paddingFactor,
        ),
        child: GridView.builder(
          itemCount: subCategories.length,
          padding: EdgeInsets.zero,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 0.035 * context.width,
            crossAxisSpacing: 0.02 * context.width,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return ItemSubCategoriesHome(
              product: subCategories[index],
            );
          },
        ),
      ),
    );
  }
}
