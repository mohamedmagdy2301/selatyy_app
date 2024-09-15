import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_product_home.dart';

class SectionFrashAndFasterHome extends StatelessWidget {
  const SectionFrashAndFasterHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "طازج وسريع",
                style: StylesManager.textStyle_11_bold(context),
              ),
            ),
          ],
        ),
        SizedBox(
          height: context.height * 0.48,
          child: GridView.builder(
            itemCount: 20,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ItemProductHome();
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 4 / 3,
            ),
          ),
        ),
      ],
    );
  }
}
