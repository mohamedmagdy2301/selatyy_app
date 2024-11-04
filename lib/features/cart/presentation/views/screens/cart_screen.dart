import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/cart/presentation/views/widgets/body_cart_screen.dart';

class CartProductScreen extends StatelessWidget {
  const CartProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundScaffold,
      body: SafeArea(
        bottom: !context.isLandscape,
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: !context.isLandscape,
                floating: context.isLandscape,
                snap: context.isLandscape,
                toolbarHeight: context.height * 0.07,
                title: Text(
                  StringsApp.cartShopping,
                  style: StylesManager.textStyle_28_bold(context).copyWith(
                    color: primaryBlack,
                  ),
                ),
                centerTitle: true,
                flexibleSpace: Container(color: backGroundScaffold),
              ),
            ];
          },
          body: const BodyCartProductScreen(),
        ),
      ),
    );
  }
}
