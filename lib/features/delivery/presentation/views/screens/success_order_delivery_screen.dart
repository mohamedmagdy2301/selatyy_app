import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/constants.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';
import 'package:selaty_app/core/widgets/custom_button.dart';
import 'package:selaty_app/features/delivery/presentation/views/widgets/custom_appbar_delivery.dart';

class SuccessOrderDeliveryScreen extends StatelessWidget {
  const SuccessOrderDeliveryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(actions: CustomAppbarDelivery.appBarActions(context)),
      body: OrientationBuilder(
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
                  Spacer(flex: 2),
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
                  Spacer(flex: 3),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * .04,
                    ),
                    child: SizedBox(
                      width: context.width * .7,
                      child: CustomButton(
                        onTap: () {
                          GoRouter.of(context)
                              .push(RoutersManager.kTimelineTileScreen);
                        },
                        titleButton: StringsApp.trackOrder,
                        colorButton: primaryWhite,
                        colorTitleButton: primaryBlack,
                      ),
                    ),
                  ),
                  Spacer(flex: 1),
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
                Spacer(flex: 1),
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
                Spacer(flex: 2),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.width * .04,
                  ),
                  child: SizedBox(
                    width: context.width * .7,
                    child: CustomButton(
                      onTap: () {
                        GoRouter.of(context)
                            .push(RoutersManager.kTimelineTileScreen);
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
    );
  }
}
