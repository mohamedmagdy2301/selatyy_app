import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_all_features.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_best_features_home.dart';

class AllFeaturesScreen extends StatelessWidget {
  const AllFeaturesScreen({super.key});

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
              toolbarHeight: context.height * 0.06,
              actions: CustomAppbarAllFeatures.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
          ];
        },
        body: OrientationBuilder(builder: (context, orientation) {
          if (orientation == Orientation.landscape) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.height * 0.04,
                horizontal: context.width * 0.2,
              ),
              child: GridView.builder(
                itemCount: 20,
                padding: EdgeInsets.zero,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: .04 * context.width,
                  crossAxisSpacing: .015 * context.width,
                  childAspectRatio: 4 / 2.7,
                ),
                itemBuilder: (context, index) {
                  return ItemBestFeaturesHome(
                    heightImageBackground: .05,
                    heightCricleImage: .04,
                  );
                },
              ),
            );
          }
          return Padding(
            padding: EdgeInsets.symmetric(
                vertical: context.height * 0.04,
                horizontal: context.width * 0.06),
            child: GridView.builder(
              itemCount: 20,
              padding: EdgeInsets.zero,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: .04 * context.width,
                crossAxisSpacing: 10,
                childAspectRatio: 4 / 2.7,
              ),
              itemBuilder: (context, index) {
                return ItemBestFeaturesHome(
                  heightImageBackground: .085,
                  heightCricleImage: .06,
                );
              },
            ),
          );
        }),
      ),
    );
  }
}
