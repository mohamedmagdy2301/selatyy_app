import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/cart/presentation/views/screens/empty_cart_screen.dart';
import 'package:selaty/features/cart/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/features/cart/presentation/views/widgets/item_product_cart_screen.dart';
import 'package:selaty/features/cart/presentation/views/widgets/total_price_cart_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (context.isLandscape) {
              return NestedScrollView(
                physics: BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: context.height * 0.06,
                      toolbarHeight: context.height * 0.06,
                      actions: CustomAppbarCart.appBarActions(context),
                      automaticallyImplyLeading: false,
                    ),
                  ];
                },
                body: Row(
                  children: [
                    Expanded(child: ItemProductCartScreen()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(),
                        TotalPriceCartScreen(),
                        SizedBox(height: context.height * .02),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: context.width * .04,
                          ),
                          child: SizedBox(
                            width: context.width * .7,
                            child: CustomButton(
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: EmptyCartScreen(),
                                  withNavBar: true,
                                  pageTransitionAnimation:
                                      PageTransitionAnimation.cupertino,
                                );
                              },
                              titleButton: StringsApp.payment,
                              colorButton: primaryGreen,
                            ),
                          ),
                        ),
                        SizedBox(height: context.height * .05),
                      ],
                    ),
                  ],
                ),
              );
            }
            return NestedScrollView(
              physics: NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: context.height * 0.06,
                    toolbarHeight: context.height * 0.06,
                    actions: CustomAppbarCart.appBarActions(context),
                    automaticallyImplyLeading: false,
                  ),
                  SliverToBoxAdapter(
                    child: ItemProductCartScreen(),
                  ),
                ];
              },
              body: Column(
                children: [
                  SizedBox(height: context.height * .01),
                  TotalPriceCartScreen(),
                  SizedBox(height: context.height * .02),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * .04,
                    ),
                    child: SizedBox(
                      width: context.width,
                      child: CustomButton(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: EmptyCartScreen(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        titleButton: StringsApp.payment,
                        colorButton: primaryGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * .02),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
