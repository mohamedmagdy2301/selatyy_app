import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/profile/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/profile/presentation/views/widgets/section_info_about_me.dart';
import 'package:selaty/features/profile/presentation/views/widgets/section_log_and_help.dart';
import 'package:selaty/features/profile/presentation/views/widgets/section_your_picture.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              actions: CustomAppbarProfile.appBarActions(context),
              automaticallyImplyLeading: false,
            ),
            SliverToBoxAdapter(child: SectionYourPicture()),
            SliverToBoxAdapter(child: SectionInfoAboutMe()),
            SliverToBoxAdapter(child: SectionLogAndHelp()),
            SliverToBoxAdapter(child: SizedBox(height: context.height * 0.018)),
          ],
        ),
      ),
    );
  }
}
