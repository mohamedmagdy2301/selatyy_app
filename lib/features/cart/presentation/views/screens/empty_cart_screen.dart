import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/cart/presentation/views/widgets/custom_appbar.dart';
import 'package:selaty/not_needed/delivery/presentation/views/screens/address_delivery_screen.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(actions: CustomAppbarCart.appBarActions(context)),
      body: SafeArea(
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (context.isLandscape) {
              return Container(
                margin: EdgeInsets.symmetric(
                  horizontal: context.width * .4,
                  vertical: context.height * .01,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: primaryWhite,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(flex: 3),
                    Image.asset(
                      kEmptyCart,
                      width: context.width * .3,
                      color: primaryRed,
                    ),
                    SizedBox(height: context.height * .02),
                    Text(
                      StringsApp.emptyCart,
                      style: StylesManager.textStyle_28_bold(context),
                    ),
                    SizedBox(height: context.height * .01),
                    Text(
                      StringsApp.addItems,
                      style: StylesManager.textStyle_10_Light(context).copyWith(
                        color: primaryGrey,
                      ),
                    ),
                    const Spacer(flex: 3),
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
                              screen: const AddressDeliveryScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          titleButton: StringsApp.startShopping,
                          colorButton: primaryGreen,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
                  ],
                ),
              );
            }
            return Container(
              margin: EdgeInsets.symmetric(
                horizontal: context.width * .04,
                vertical: context.height * .1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryWhite,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Image.asset(
                    kEmptyCart,
                    width: context.width * .3,
                    color: primaryRed,
                  ),
                  SizedBox(height: context.height * .02),
                  Text(
                    StringsApp.emptyCart,
                    style: StylesManager.textStyle_28_bold(context),
                  ),
                  SizedBox(height: context.height * .01),
                  Text(
                    StringsApp.addItems,
                    style: StylesManager.textStyle_10_Light(context).copyWith(
                      color: primaryGrey,
                    ),
                  ),
                  const Spacer(flex: 1),
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
                            screen: const AddressDeliveryScreen(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        titleButton: StringsApp.startShopping,
                        colorButton: primaryGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * .05),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
