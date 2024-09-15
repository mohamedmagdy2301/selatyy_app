import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/home/presentation/views/widgets/secation_abs_card_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_best_features_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_catagory_features_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_frash_and_faster_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_most_seller_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_search_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_seize_opportunity_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_shop_by_offer_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCubit = context.read<TabCubit>();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 238, 238, 238),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              expandedHeight: context.height * 0.08,
              toolbarHeight: context.height * 0.075,
              flexibleSpace: Container(
                color: Color.fromARGB(255, 238, 238, 238),
              ),
              actions: CustomAppbarHome.appBarActions(context, () {
                tabCubit.updateTabIndex(0);
              }),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(child: SectionSearchHome()),
            SliverToBoxAdapter(child: SectionCatagoryFeaturesHome()),
            SliverToBoxAdapter(child: SectionBestFeaturesHome()),
            SliverToBoxAdapter(child: SectionMostSellerHome()),
            SliverToBoxAdapter(child: SecationAbsCardHome()),
            SliverToBoxAdapter(child: SectionShopByOfferHome()),
            SliverToBoxAdapter(child: SectionFrashAndFasterHome()),
            SliverToBoxAdapter(child: SecationAbsCardHome()),
            SliverToBoxAdapter(child: SectionSeizeOpportunityHome()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),
          ],
        ),
      ),
    );
  }
}
