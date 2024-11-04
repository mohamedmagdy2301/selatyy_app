import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
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
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: !context.isLandscape,
              floating: context.isLandscape,
              snap: context.isLandscape,
              elevation: 0,
              // expandedHeight: context.height * 0.08,
              toolbarHeight: context.height * 0.075,
              title: Text(
                'الملف الشخصي',
                style: StylesManager.textStyle_28_bold(context)
                    .copyWith(color: primaryBlack),
              ),
              centerTitle: true,
              flexibleSpace: Container(color: backGroundScaffold),
              leading: CustomAppbarProfile.appBarActions(
                  context, () => tabCubit.updateTabIndex(0)),
            ),
            context.isLandscape
                ? const SliverToBoxAdapter(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SectionLogAndHelp(),
                        SectionYourPicture(),
                      ],
                    ),
                  )
                : SliverToBoxAdapter(
                    child: Column(
                      children: [
                        SizedBox(height: context.height * 0.06),
                        const SectionYourPicture(),
                        SizedBox(height: context.height * 0.018),
                        const SectionLogAndHelp(),
                        SizedBox(height: context.height * 0.018),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
            // SliverToBoxAdapter(child: SizedBox(height: context.height * 0.07)),
            // SliverToBoxAdapter(child: SectionYourPicture()),
            // SliverToBoxAdapter(child: SizedBox(height: context.height * 0.018)),
            // SliverToBoxAdapter(child: SectionLogAndHelp()),
            // SliverToBoxAdapter(child: SizedBox(height: context.height * 0.018)),
