import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_all_item_features.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_search_home.dart';

class AllItemFeatureScreen extends StatelessWidget {
  const AllItemFeatureScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: NestedScrollView(
        physics: NeverScrollableScrollPhysics(),
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: context.height * 0.06,
              toolbarHeight: context.height * 0.09,
              backgroundColor: primaryGreen,
              actions: CustomAppbarAllItemFeatures.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
            SliverToBoxAdapter(child: SectionSearchHome()),
          ];
        },
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.2,
              ),
              child: GridView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: .04 * context.width,
                  crossAxisSpacing: .015 * context.width,
                  childAspectRatio: 4 / 4,
                ),
                itemBuilder: (context, index) {
                  return ItemProductHome();
                },
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height * 0.02,
                horizontal: context.width * 0.06),
            child: GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: .035 * context.width,
                crossAxisSpacing: .02 * context.width,
                childAspectRatio: 4 / 3.8,
              ),
              itemBuilder: (context, index) {
                return ItemProductHome();
              },
            ),
          );
        }),
      ),
    );
  }
}
