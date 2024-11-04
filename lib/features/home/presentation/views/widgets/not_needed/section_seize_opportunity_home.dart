import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/features/home/presentation/views/widgets/not_needed/item_seize_opportunity_home.dart';

class SectionSeizeOpportunityHome extends StatelessWidget {
  const SectionSeizeOpportunityHome({super.key});

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
                "انتهز الفرصة",
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
              return const ItemSeizeOpportunityHome();
            },
          ),
        ),
      ],
    );
  }
}
