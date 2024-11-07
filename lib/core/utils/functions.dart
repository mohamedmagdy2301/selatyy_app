import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:selaty/features/cart/presentation/view%20model/cart_cubit.dart';

void hideKeyboard() => FocusManager.instance.primaryFocus?.unfocus();

bool isKeyboardVisible(BuildContext context) =>
    MediaQuery.of(context).viewInsets.bottom > 0;

Future<void> showQuantityDialog(
  BuildContext context,
  int id,
  String name,
  String details,
  String price,
  String image,
  int quantityProduct,
) async {
  final TextEditingController quantityController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('اختر الكمية'),
          content: Form(
            key: formKey,
            child: TextFormField(
              controller: quantityController,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) => _validateQuantity(value, quantityProduct),
              keyboardType: TextInputType.number,
              decoration:
                  _buildInputDecoration(quantityProduct, quantityController),
            ),
          ),
          actions: [
            _buildDialogButton(
              context,
              'أضف لعربة التسوق',
              () => _onAddToCart(
                context,
                formKey,
                quantityController,
                id,
                name,
                details,
                price,
                image,
              ),
            ),
            _buildDialogButton(
              context,
              'إلغاء',
              () {
                Navigator.of(context).pop();
                hideKeyboard();
              },
            ),
          ],
        ),
      );
    },
  );
}

String? _validateQuantity(String? value, int quantityProduct) {
  if (value == null || value.isEmpty) return 'الكمية مطلوبة';

  // Check if the value contains any non-numeric characters
  if (value.contains(RegExp(r'[^\d]'))) {
    return 'الكمية يجب أن تكون عددًا صحيحًا \nولا تحتوي على أحرف أو رموز';
  }

  // Check if the value is a valid integer after confirming it's numeric
  final quantity = int.tryParse(value);
  if (quantity == null) return 'الكمية يجب أن تكون عددًا صحيحًا';

  // Range checks for the quantity
  if (quantity < 1 || quantity > quantityProduct) {
    return 'الكمية المطلوبة لهذا المنتج غير متوفرة';
  }

  return null;
}

InputDecoration _buildInputDecoration(
    int quantityProduct, TextEditingController controller) {
  return InputDecoration(
    labelText: 'الكمية المتوفرة هي $quantityProduct',
    floatingLabelStyle: const TextStyle(color: primaryGreen),
    errorStyle: const TextStyle(color: Colors.red),
    border:
        const OutlineInputBorder(borderSide: BorderSide(color: primaryGreen)),
    enabledBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: primaryGreen)),
    focusedBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: primaryGreen)),
    errorBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    focusedErrorBorder:
        const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    contentPadding: const EdgeInsets.symmetric(horizontal: 15),
    suffixIcon: controller.text.isEmpty
        ? null
        : IconButton(
            onPressed: controller.clear,
            icon: const Icon(Icons.clear),
          ),
  );
}

TextButton _buildDialogButton(
  BuildContext context,
  String text,
  VoidCallback onPressed,
) {
  return TextButton(
    onPressed: onPressed,
    child: Text(
      text,
      style: TextStyle(color: primaryBlack, fontSize: 4 * context.textScale),
    ),
  );
}

void _onAddToCart(
  BuildContext context,
  GlobalKey<FormState> formKey,
  TextEditingController quantityController,
  int id,
  String name,
  String details,
  String price,
  String image,
) {
  if (formKey.currentState?.validate() ?? false) {
    formKey.currentState?.save();
    final int quantity = int.parse(quantityController.text);

    context.read<CartCubit>().addProduct(
          ProductCart(
            id: id,
            name: name,
            image: image,
            details: details,
            price: double.parse(price),
            quantity: quantity,
          ),
        );

    Navigator.of(context).pop();
    hideKeyboard();
  }
}
