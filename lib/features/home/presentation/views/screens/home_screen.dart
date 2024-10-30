import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_slider_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_categories_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_most_seller_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_search_home.dart';
import 'package:selaty/selaty%20app/cubit.dart';

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
            BlocBuilder<ViewUserProfileCubit, ViewUserProfileState>(
              builder: (context, state) {
                return SliverAppBar(
                  pinned: true,
                  expandedHeight: context.height * 0.08,
                  toolbarHeight: context.height * 0.075,
                  flexibleSpace: Container(
                    color: Color.fromARGB(255, 238, 238, 238),
                  ),
                  actions: CustomAppbarHome.appBarActions(
                    context,
                    () {
                      tabCubit.updateTabIndex(0);
                    },
                    name: state is ViewUserProfileDone
                        ? state.userProfileInfo.name!
                        : '',
                    address: state is ViewUserProfileDone
                        ? state.userProfileInfo.address!
                        : '',
                    image: state is ViewUserProfileDone
                        ? state.userProfileInfo.profilePhotoUrl!
                        : kAvatarImageUrl,
                  ),
                  automaticallyImplyLeading: false,
                );
              },
            ),
            SliverToBoxAdapter(child: SectionSearchHome()),
            SliverToBoxAdapter(child: BuildSliderHome()),
            SliverToBoxAdapter(child: SectionCategoriesHome()),
            SliverToBoxAdapter(child: SectionMostSellerHome()),
          ],
        ),
      ),
    );
  }
}
            // SliverToBoxAdapter(child: SecationAbsCardHome()),
            // SliverToBoxAdapter(child: SectionShopByOfferHome()),
            // SliverToBoxAdapter(child: SectionFrashAndFasterHome()),
            // SliverToBoxAdapter(child: SecationAbsCardHome()),
            // SliverToBoxAdapter(child: SectionSeizeOpportunityHome()),
            // SliverToBoxAdapter(child: SizedBox(height: context.height * 0.02)),