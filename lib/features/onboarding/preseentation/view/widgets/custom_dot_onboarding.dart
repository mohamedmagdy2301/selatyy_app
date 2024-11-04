import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/onboarding/data/models/onboarding_model.dart';

class CustomDotOnboarding extends StatelessWidget {
  const CustomDotOnboarding(
      {super.key,
      required this.index,
      required this.currentIndex,
      required this.onboradingInfo});
  final int index, currentIndex;
  final List<OnboradingInfoModel> onboradingInfo;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.012,
      width:
          currentIndex == index ? context.width * 0.05 : context.width * 0.02,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: onboradingInfo[currentIndex].color,
      ),
    );
  }
}
