import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/selaty%20app/cubit.dart';
import 'package:selaty/features/Profile/presentation/views/screens/profile_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty/selaty%20app/some_screens.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabCubit(), // Provide the TabCubit
      child: BlocBuilder<TabCubit, TabIndexState>(
        builder: (context, state) {
          final tabCubit = context.read<TabCubit>();
          PersistentTabController controller = tabCubit.controller;
          return PersistentTabView(
            context,
            controller: controller,
            confineToSafeArea: true,
            resizeToAvoidBottomInset: true,
            stateManagement: true,
            hideNavigationBarWhenKeyboardAppears: true,
            navBarHeight: 0.06 * context.height,
            screens: getScreens(),
            items: getNavBarItems(context, state),
            navBarStyle: NavBarStyle.style15,
            onItemSelected: (index) {
              tabCubit.updateTabIndex(index);
              controller.jumpToTab(index);
            },
          );
        },
      ),
    );
  }

  List<Widget> getScreens() {
    return [
      ProfileScreen(),
      NotificationsScreen(),
      HomeScreen(),
      SearchScreen(),
      SettingsScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> getNavBarItems(context, state) {
    // double iconSize = 5 * context.textScale as double;

    return [
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Padding(
          padding: EdgeInsets.only(
              // top: .015 * context.height,
              ),
          child: Icon(Icons.person),
        ),
        title: " ",
        activeColorPrimary:
            (state.currentIndex == 0) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Padding(
          padding: EdgeInsets.only(
              // top: .015 * context.height,
              ),
          child: Icon(Icons.notifications),
        ),
        title: " ",
        activeColorPrimary:
            (state.currentIndex == 1) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Image.asset(
          kLogo,
          fit: BoxFit.cover,
        ),
        title: " ",
        activeColorPrimary:
            (state.currentIndex == 2) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Padding(
          padding: EdgeInsets.only(
              // top: .015 * context.height,
              ),
          child: Icon(Icons.search),
        ),
        title: " ",
        activeColorPrimary:
            (state.currentIndex == 3) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Padding(
          padding: EdgeInsets.only(
              // top: .015 * context.height,
              ),
          child: Icon(Icons.settings),
        ),
        title: " ",
        activeColorPrimary:
            (state.currentIndex == 4) ? primaryGreen : primaryGrey,
      ),
    ];
  }
}
