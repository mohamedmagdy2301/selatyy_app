import 'package:flutter/material.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/onboarding/data/models/onboarding_model.dart';
import 'package:selaty/features/onboarding/preseentation/view/widgets/custom_cricle_button_onboarding.dart';
import 'package:selaty/features/onboarding/preseentation/view/widgets/custom_dot_onboarding.dart';
import 'package:selaty/features/onboarding/preseentation/view/widgets/section_info_onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<OnboradingInfoModel> onboradingInfo = [
    OnboradingInfoModel(
        title: StringsApp.onboardingTitle1,
        color: primaryRed,
        image: kShopOnboarding,
        desc: StringsApp.onboardingDesc1),
    OnboradingInfoModel(
        title: StringsApp.onboardingTitle2,
        color: primaryGreen,
        image: kDeliveryOnboarding,
        desc: StringsApp.onboardingDesc2),
    OnboradingInfoModel(
        title: StringsApp.onboardingTitle3,
        color: primaryDarkGrey,
        image: kDeliveryOnboarding,
        desc: StringsApp.onboardingDesc2),
  ];

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation != Orientation.portrait;
    return Scaffold(
      body: Container(
        width: isLandscape ? context.height : context.width,
        height: isLandscape ? context.width : context.height,
        decoration: kBackgroundDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width * 0.055),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: context.height * 0.01),
              Expanded(
                child: PageView.builder(
                  itemCount: onboradingInfo.length,
                  controller: _controller,
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return SectionInfoOnboarding(
                      onboradingInfo: onboradingInfo,
                      index: index,
                    );
                  },
                ),
              ),
              isLandscape
                  ? SizedBox()
                  : SizedBox(height: context.height * 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(onboradingInfo.length, (index) {
                      return CustomDotOnboarding(
                        currentIndex: currentIndex,
                        index: index,
                        onboradingInfo: onboradingInfo,
                      );
                    }),
                  ),
                  CustomCricleButtonOnboarding(
                    currentIndex: currentIndex,
                    onboradingInfo: onboradingInfo,
                    controller: _controller,
                  ),
                ],
              ),
              isLandscape
                  ? SizedBox(height: context.height * 0.02)
                  : SizedBox(height: context.height * 0.09),
            ],
          ),
        ),
      ),
    );
  }
}
