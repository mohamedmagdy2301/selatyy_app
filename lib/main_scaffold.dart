import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/presentation/views/screens/home_screen.dart';
import 'package:selaty/some_screens.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 2);
  final List<Widget> screens = [
    SearchScreen(),
    NotificationsScreen(),
    HomeScreen(),
    ProfileScreen(),
    SettingsScreen(),
  ];

  int currentIndex = 2;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PersistentBottomNavBarItem> getNavBarItems() {
    return [
      PersistentBottomNavBarItem(
        iconSize: 5 * context.textScale,
        icon: Padding(
          padding: EdgeInsets.only(
            top: .015 * context.height,
          ),
          child: Icon(Icons.search),
        ),
        title: " ",
        activeColorPrimary: primaryGreen,
        inactiveColorPrimary: primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 5 * context.textScale,
        icon: Padding(
          padding: EdgeInsets.only(
            top: .015 * context.height,
          ),
          child: Icon(Icons.notifications),
        ),
        title: " ",
        activeColorPrimary: primaryGreen,
        inactiveColorPrimary: primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 5 * context.textScale,
        icon: Image.asset(
          kLogo,
          fit: BoxFit.cover,
        ),
        title: " ",
        activeColorPrimary: (currentIndex == 2) ? primaryGreen : primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 5 * context.textScale,
        icon: Padding(
          padding: EdgeInsets.only(
            top: .015 * context.height,
          ),
          child: Icon(Icons.person),
        ),
        title: " ",
        activeColorPrimary: primaryGreen,
        inactiveColorPrimary: primaryGrey,
      ),
      PersistentBottomNavBarItem(
        iconSize: 5 * context.textScale,
        icon: Padding(
          padding: EdgeInsets.only(
            top: .015 * context.height,
          ),
          child: Icon(Icons.settings),
        ),
        title: " ",
        activeColorPrimary: primaryGreen,
        inactiveColorPrimary: primaryGrey,
      ),
    ];
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
}
