import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/secation_abs_card_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_best_features_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_catagory_features_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_frash_and_faster_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_most_seller_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_search_home.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/section_shop_by_offer_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isLandscape
              ? MediaQuery.of(context).padding.horizontal * 0.5
              : 0,
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: context.height * 0.08,
              toolbarHeight: context.height * 0.08,
              actions: CustomAppbarHome.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(child: SectionSearchHome()),
            SliverToBoxAdapter(child: SectionBestFeaturesHome()),
            SliverToBoxAdapter(child: SectionCatagoryFeaturesHome()),
            SliverToBoxAdapter(child: SectionMostSellerHome()),
            SliverToBoxAdapter(child: SecationAbsCardHome()),
            SliverToBoxAdapter(child: SectionShopByOfferHome()),
            SliverToBoxAdapter(child: SectionFrashAndFasterHome()),
            SliverToBoxAdapter(child: SecationAbsCardHome()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.1)),
          ],
        ),
      ),
    );
  }
}