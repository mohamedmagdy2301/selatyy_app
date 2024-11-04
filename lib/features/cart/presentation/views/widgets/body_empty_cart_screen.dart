import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/selaty%20app/cubit.dart';

class BodyEmptyCartProductScreen extends StatelessWidget {
  const BodyEmptyCartProductScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.cart,
                size: context.isLandscape
                    ? context.textScale * 30
                    : context.textScale * 50,
                color: primaryLightGrey,
              ),
              SizedBox(
                  height: context.isLandscape
                      ? context.height * .01
                      : context.height * .03),
              Text(
                "${StringsApp.emptyCart}\n${StringsApp.addItems}",
                textAlign: TextAlign.center,
                style: StylesManager.textStyle_28_bold(context).copyWith(
                  fontSize: context.isLandscape
                      ? 4 * context.textScale
                      : 5 * context.textScale,
                  fontWeight: FontWeight.bold,
                  color: primaryGrey,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.width * .04,
          ),
          child: SizedBox(
            width: context.width,
            child: CustomButton(
              onTap: () {
                context.read<TabCubit>().updateTabIndex(0);
              },
              titleButton: StringsApp.startShopping,
              colorButton: primaryGreen,
            ),
          ),
        ),
        SizedBox(
            height: context.isLandscape
                ? context.height * .02
                : context.height * .05),
      ],
    );
  }
}
