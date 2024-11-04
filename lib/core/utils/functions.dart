import 'package:flutter/material.dart';

hideKeybourd() {
  FocusManager.instance.primaryFocus?.unfocus();
}

bool isKeybordVisible(BuildContext context) {
  // return WidgetsBinding.instance.window.viewInsets.bottom > 0.0 ? true : false;
  return MediaQuery.of(context).viewInsets.bottom > 0 ? true : false;
}

Future<void> showQuantityDialog(
    BuildContext context, Function(int) addProduct) async {
  final TextEditingController quantityController = TextEditingController();

  quantityController.text = "1";

  quantityController.selection = TextSelection.fromPosition(
      TextPosition(offset: quantityController.text.length));

  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: AlertDialog(
          title: const Text('اختر الكمية'),
          content: TextField(
            controller: quantityController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'الكمية',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                int quantity = int.tryParse(quantityController.text) ?? 1;
                addProduct(quantity);
                Navigator.of(context).pop();
                hideKeybourd();
              },
              child: const Text('أضف إلى عربة التسوق'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                hideKeybourd();
              },
              child: const Text('إلغاء'),
            ),
          ],
        ),
      );
    },
  );
}
