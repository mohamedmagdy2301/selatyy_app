import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/widgets/custom_button.dart';
import 'package:selaty_app/features/delivery/presentation/views/widgets/custom_appbar_delivery.dart';
import 'package:selaty_app/features/delivery/presentation/views/widgets/details_address_delivry_screen.dart';

class AddressDeliveryScreen extends StatelessWidget {
  const AddressDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      body: OrientationBuilder(
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
                    Expanded(child: DetailsAddressDelivryScreen()),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: context.height * .02),
                        CustomButton(
                          onTap: () {
                            GoRouter.of(context).push(
                                RoutersManager.kSuccessOrderDeliveryScreen);
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
            physics: NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  pinned: true,
                  expandedHeight: context.height * 0.06,
                  toolbarHeight: context.height * 0.06,
                  actions: CustomAppbarDelivery.appBarActions(context),
                  automaticallyImplyLeading: false,
                ),
                SliverToBoxAdapter(
                  child: DetailsAddressDelivryScreen(),
                ),
              ];
            },
            body: Column(
              children: [
                Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * .04,
                  ),
                  child: SizedBox(
                    width: context.width,
                    child: CustomButton(
                      onTap: () {
                        GoRouter.of(context)
                            .push(RoutersManager.kSuccessOrderDeliveryScreen);
                      },
                      titleButton: StringsApp.deliveryForThisAddress,
                      colorButton: primaryGreen,
                    ),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          );
        },
      ),
    );
  }
}
