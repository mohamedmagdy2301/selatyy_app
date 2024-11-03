import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/features/auth/presentation/views/screens/profile_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/favorits_products_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';

import 'cubit.dart';
import 'some_screens.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TabCubit(),
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
            screens: getScreens(),
            items: getNavBarItems(context, state),
            navBarStyle: NavBarStyle.style1,
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
      HomeScreen(),
      SearchScreen(),
      FavoritesProductsScreen(),
      ProfileScreen(),
    ];
  }

  List<PersistentBottomNavBarItem> getNavBarItems(context, state) {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset(kLogo),
        title: "الصفحة الرئسية",
        activeColorPrimary:
            (state.currentIndex == 0) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.cart_fill),
        title: "عربة التسوق",
        activeColorPrimary:
            (state.currentIndex == 1) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.heart_fill),
        title: "المفضلة",
        activeColorPrimary:
            (state.currentIndex == 2) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.person),
        title: "الملف الشخصي",
        activeColorPrimary:
            (state.currentIndex == 3) ? primaryGreen : primaryGrey,
      ),
    ];
  }
}
