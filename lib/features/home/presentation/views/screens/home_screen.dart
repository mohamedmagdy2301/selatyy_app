import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_slider_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_appbar_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_categories_home.dart';
import 'package:selaty/features/home/presentation/views/widgets/section_products_home.dart';
import 'package:selaty/selaty%20app/cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final tabCubit = context.read<TabCubit>();
    return Scaffold(
      backgroundColor: backGroundScaffold,
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            BlocBuilder<ViewUserProfileCubit, ViewUserProfileState>(
              builder: (context, state) {
                return SliverAppBar(
                  // pinned: true,
                  floating: true,
                  snap: true, expandedHeight: context.height * 0.08,
                  toolbarHeight: context.height * 0.075,
                  flexibleSpace: Container(color: backGroundScaffold),

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
                        ? state.userProfileInfo.profilePhotoPath ?? "30.jpg"
                        : "30.jpg",
                  ),
                  automaticallyImplyLeading: false,
                );
              },
            ),
            const SliverToBoxAdapter(child: BuildSliderHome()),
            const SliverToBoxAdapter(child: SectionCategoriesHome()),
            const SliverToBoxAdapter(child: SectionMostSellerHome()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.03)),
          ],
        ),
      ),
    );
  }
}
