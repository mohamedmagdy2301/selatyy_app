import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/features/cart/presentation/view%20model/cart_cubit.dart';
import 'package:selaty/features/cart/presentation/views/widgets/body_empty_cart_screen.dart';
import 'package:selaty/features/cart/presentation/views/widgets/item_product_cart_screen.dart';
import 'package:selaty/features/cart/presentation/views/widgets/total_price_cart_screen.dart';

class BodyCartProductScreen extends StatelessWidget {
  const BodyCartProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartUser = state.cartUser;

        return cartUser.productCart?.isEmpty ?? true
            ? const BodyEmptyCartProductScreen()
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartUser.productCart!.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final product = cartUser.productCart![index];
                        return Dismissible(
                          key: Key(product.id.toString()),
                          onDismissed: (direction) {
                            context
                                .read<CartCubit>()
                                .removeProduct(product.id.toString());
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.white,
                            ),
                          ),
                          child: ItemProductCartScreen(
                            productCart: product,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: context.height * .01),
                  TotalPriceCartScreen(cartUser: cartUser),
                  SizedBox(height: context.height * .02),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: context.width * .04),
                    child: SizedBox(
                      width: context.width,
                      child: CustomButton(
                        onTap: () {
                          // Navigate to the EmptyCartScreen or other action
                        },
                        titleButton: StringsApp.payment,
                        colorButton: primaryGreen,
                      ),
                    ),
                  ),
                  SizedBox(height: context.height * .005),
                ],
              );
      },
    );
  }
}
 // ScaffoldMessenger.of(context).showSnackBar(
                            //   snackBarAnimationStyle: AnimationStyle(
                            //     duration: const Duration(seconds: 1),
                            //     reverseDuration: const Duration(seconds: 1),
                            //     curve: Curves.fastOutSlowIn,
                            //     reverseCurve: Curves.fastOutSlowIn,
                            //   ),
                            //   SnackBar(
                            //     showCloseIcon: true,
                            //     content: const Text('تم الحذف بنجاح'),
                            //     duration: const Duration(seconds: 1),
                            //     action: SnackBarAction(
                            //       label: 'رجوع',
                            //       onPressed: () {
                            //         context
                            //             .read<CartCubit>()
                            //             .addProduct(product);
                            //       },
                            //     ),
                            //   ),
                            // );