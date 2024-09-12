import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/constants.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/Strings_app.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';
import 'package:selaty_app/core/widgets/custom_button.dart';
import 'package:selaty_app/features/cart/presentation/views/widgets/custom_appbar.dart';

class EmptyCartScreen extends StatelessWidget {
  const EmptyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 234, 234),
      appBar: AppBar(actions: CustomAppbarCart.appBarActions(context)),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.isLandscape
              ? MediaQuery.of(context).padding.horizontal * 0.5
              : 0,
        ),
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
                    Spacer(flex: 3),
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
                                .push(RoutersManager.kAddressDeliveryScreen);
                          },
                          titleButton: StringsApp.startShopping,
                          colorButton: primaryGreen,
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
                vertical: context.height * .1,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: primaryWhite,
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Spacer(flex: 1),
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
                  Spacer(flex: 1),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * .04,
                    ),
                    child: SizedBox(
                      width: context.width * .7,
                      child: CustomButton(
                        onTap: () {
                          GoRouter.of(context)
                              .push(RoutersManager.kAddressDeliveryScreen);
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
