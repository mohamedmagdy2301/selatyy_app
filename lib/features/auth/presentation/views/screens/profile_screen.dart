import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/custom_appbar.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/section_log_and_help.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/section_your_picture.dart';
import 'package:selaty/selaty%20app/cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
              actions: CustomAppbarProfile.appBarActions(context, () {
                tabCubit.updateTabIndex(2);
              }),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.07)),
            SliverToBoxAdapter(child: SectionYourPicture()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.018)),
            // SliverToBoxAdapter(child: SectionInfoAboutMe()),
            SliverToBoxAdapter(child: SectionLogAndHelp()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.018)),
          ],
        ),
      ),
    );
  }
}
