import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';

class SectionCatagoryFeaturesHome extends StatelessWidget {
  const SectionCatagoryFeaturesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: context.width * 0.03),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "التصنيفات",
                style: StylesManager.textStyle_11_bold(context),
              ),
              Text(
                " << عرض الكل",
                style: StylesManager.textStyle_9_Medium(context).copyWith(
                  color: primaryDarkGrey,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: context.height * 0.16,
          child: ListView.builder(
            itemCount: 10,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/fruits_img.jpg',
                    fit: BoxFit.fill,
                    height: context.height * 0.16,
                    width: context.width * 0.3,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
