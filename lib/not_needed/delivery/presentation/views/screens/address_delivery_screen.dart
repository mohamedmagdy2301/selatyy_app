import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/not_needed/delivery/presentation/views/screens/success_order_delivery_screen.dart';
import 'package:selaty/not_needed/delivery/presentation/views/widgets/custom_appbar_delivery.dart';
import 'package:selaty/not_needed/delivery/presentation/views/widgets/details_address_delivry_screen.dart';

class AddressDeliveryScreen extends StatelessWidget {
  const AddressDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (context.isLandscape) {
              return NestedScrollView(
                physics: const BouncingScrollPhysics(),
                headerSliverBuilder: (context, innerBoxIsScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      expandedHeight: context.height * 0.06,
                      toolbarHeight: context.height * 0.06,
                      actions: CustomAppbarDelivery.appBarActions(context),
                      automaticallyImplyLeading: false,
                    ),
                  ];
                },
                body: Padding(
                  padding: EdgeInsets.symmetric(horizontal: context.width * .4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(child: DetailsAddressDelivryScreen()),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(height: context.height * .02),
                          CustomButton(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(
                                context,
                                screen: const SuccessOrderDeliveryScreen(),
                                withNavBar: true,
                                pageTransitionAnimation:
                                    PageTransitionAnimation.cupertino,
                              );
                            },
                            titleButton: StringsApp.deliveryForThisAddress,
                            colorButton: primaryGreen,
                          ),
                          SizedBox(height: context.height * .02),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }
            return NestedScrollView(
              physics: const NeverScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: context.height * 0.06,
                    toolbarHeight: context.height * 0.06,
                    actions: CustomAppbarDelivery.appBarActions(context),
                    automaticallyImplyLeading: false,
                  ),
                  const SliverToBoxAdapter(
                    child: DetailsAddressDelivryScreen(),
                  ),
                ];
              },
              body: Column(
                children: [
                  const Spacer(flex: 1),
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
                            screen: const SuccessOrderDeliveryScreen(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        titleButton: StringsApp.deliveryForThisAddress,
                        colorButton: primaryGreen,
                      ),
                    ),
                  ),
                  const Spacer(flex: 1),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
