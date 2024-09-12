import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/core/utils/text_styles.dart';

class SectionBestFeaturesHome extends StatelessWidget {
  const SectionBestFeaturesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.width * 0.05, vertical: context.width * 0.03),
          child: Row(
            children: [
              Text(
                "القيمه الافضل",
                style: StylesManager.textStyle_11_bold(context),
              ),
              SizedBox(width: context.width * 0.01),
              Text(
                "اعلى المبيعات",
                style: StylesManager.textStyle_8_Medium(context).copyWith(
                  color: primaryDarkGrey,
                ),
              ),
              Spacer(),
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
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    'assets/images/fruits_category.jpg',
                    fit: BoxFit.fill,
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