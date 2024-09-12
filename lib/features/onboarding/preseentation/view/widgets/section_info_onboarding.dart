import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/features/onboarding/data/models/onboarding_model.dart';
import 'package:selaty_app/features/onboarding/preseentation/view/widgets/cricle_image_onboarding.dart';

class SectionInfoOnboarding extends StatelessWidget {
  const SectionInfoOnboarding({
    super.key,
    required this.onboradingInfo,
    required this.index,
  });

  final List<OnboradingInfoModel> onboradingInfo;
  final int index;

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation != Orientation.portrait;
    return isLandscape
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      onboradingInfo[index].title,
                      style: TextStyle(
                        fontSize: 5 * context.textScale,
                        fontWeight: FontWeight.w900,
                        color: onboradingInfo[index].color,
                      ),
                    ),
                    SizedBox(height: context.height * 0.02),
                    Text(
                      onboradingInfo[index].desc,
                      style: TextStyle(
                        fontSize: 4 * context.textScale,
                        fontWeight: FontWeight.w400,
                        color: primaryDarkGrey,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: context.width * 0.06),
              CricleImageOnboarding(
                color: onboradingInfo[index].color,
                image: onboradingInfo[index].image,
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: context.height * 0.0001),
              CricleImageOnboarding(
                color: onboradingInfo[index].color,
                image: onboradingInfo[index].image,
              ),
              SizedBox(height: context.height * 0.03),
              Text(
                onboradingInfo[index].title,
                style: TextStyle(
                  fontSize: 5 * context.textScale,
                  fontWeight: FontWeight.w900,
                  color: onboradingInfo[index].color,
                ),
              ),
              SizedBox(height: context.height * 0.02),
              Text(
                onboradingInfo[index].desc,
                style: TextStyle(
                  fontSize: 5 * context.textScale,
                  fontWeight: FontWeight.w400,
                  color: primaryDarkGrey,
                ),
              ),
              SizedBox(height: context.height * 0.08),
            ],
          );
  }
}
