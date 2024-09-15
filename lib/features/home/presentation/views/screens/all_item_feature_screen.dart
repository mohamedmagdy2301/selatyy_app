import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_all_item_features.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_search_home.dart';

class AllItemFeatureScreen extends StatelessWidget {
  const AllItemFeatureScreen({super.key});

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
              actions: CustomAppbarAllItemFeatures.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(
                child: SizedBox(height: screenSize.height * 0.02)),
            const SliverToBoxAdapter(child: SectionSearchHome()),
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
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 0.035 * screenSize.width,
                  crossAxisSpacing: 0.02 * screenSize.width,
                  childAspectRatio: isLandscape ? 0.78 : 0.85,
                ),
                itemBuilder: (context, index) {
                  return const ItemProductHome();
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
