import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/not_needed/delivery/presentation/views/screens/timeline_tile_screen.dart';
import 'package:selaty/not_needed/delivery/presentation/views/widgets/custom_appbar_delivery.dart';

class SuccessOrderDeliveryScreen extends StatelessWidget {
  const SuccessOrderDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(actions: CustomAppbarDelivery.appBarActions(context)),
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
                  color: primaryGreen,
                ),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    const Spacer(flex: 2),
                    Image.asset(
                      kSuccessBagDelivery,
                      width: context.width * .4,
                      color: primaryRed,
                    ),
                    Text(
                      StringsApp.successDeliveryOrder,
                      style: StylesManager.textStyle_28_bold(context).copyWith(
                        color: primaryWhite,
                      ),
                    ),
                    SizedBox(height: context.height * .005),
                    Text(
                      StringsApp.thankYouOfOrder,
                      textAlign: TextAlign.center,
                      style: StylesManager.textStyle_10_Light(context).copyWith(
                        color: primaryWhite,
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
                              screen: const TimelineTileScreen(),
                              withNavBar: true,
                              pageTransitionAnimation:
                                  PageTransitionAnimation.cupertino,
                            );
                          },
                          titleButton: StringsApp.trackOrder,
                          colorButton: primaryWhite,
                          colorTitleButton: primaryBlack,
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
                vertical: context.height * .13,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryGreen,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  const Spacer(flex: 1),
                  Image.asset(
                    kSuccessBagDelivery,
                    width: context.width * .4,
                    color: primaryRed,
                  ),
                  SizedBox(height: context.height * .02),
                  Text(
                    StringsApp.successDeliveryOrder,
                    style: StylesManager.textStyle_28_bold(context).copyWith(
                      color: primaryWhite,
                    ),
                  ),
                  SizedBox(height: context.height * .01),
                  Text(
                    StringsApp.thankYouOfOrder,
                    style: StylesManager.textStyle_10_Light(context).copyWith(
                      color: primaryWhite,
                    ),
                  ),
                  const Spacer(flex: 2),
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
                            screen: const TimelineTileScreen(),
                            withNavBar: true,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          );
                        },
                        titleButton: StringsApp.trackOrder,
                        colorButton: primaryWhite,
                        colorTitleButton: primaryBlack,
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
