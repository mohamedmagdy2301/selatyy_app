import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
<<<<<<< HEAD
=======
import 'package:selaty/cubit.dart';
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
import 'package:selaty/features/Profile/presentation/views/screens/profile_screen.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty/some_screens.dart';

class MainScaffold extends StatelessWidget {
  final Widget child;

  const MainScaffold({required this.child});

  @override
<<<<<<< HEAD
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 2;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  final List<Widget> screens = [
    ProfileScreen(),
    NotificationsScreen(),
    HomeScreen(),
    SearchScreen(),
    SettingsScreen(),
  ];

  List<PersistentBottomNavBarItem> getNavBarItems() {
=======
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

>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
    return [
      PersistentBottomNavBarItem(
        iconSize: 30,
        icon: Padding(
          padding: EdgeInsets.only(
<<<<<<< HEAD
            top: .015 * context.height,
          ),
=======
              // top: .015 * context.height,
              ),
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
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
<<<<<<< HEAD
            top: .015 * context.height,
          ),
=======
              // top: .015 * context.height,
              ),
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
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
<<<<<<< HEAD

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      confineToSafeArea: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      navBarHeight: 0.06 * context.height,
      screens: screens,
      items: getNavBarItems(),
      navBarStyle: NavBarStyle.style15,
      onItemSelected: (index) {
        currentIndex = index;
        setState(() {});
      },
    );
  }
=======
>>>>>>> d8ef5c981c73e3178f8845d1bc3d03f0216654a1
}
