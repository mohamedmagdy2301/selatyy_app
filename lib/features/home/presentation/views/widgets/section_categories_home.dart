import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/build/build_categories_home.dart';

class SectionCategoriesHome extends StatelessWidget {
  const SectionCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: context.width * 0.03),
          child: Text(
            "التصنيفات",
            style: StylesManager.textStyle_14_bold(context),
          ),
        ),
        const BuildCategoriesHome()
      ],
    );
  }
}
