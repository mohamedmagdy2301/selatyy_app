import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty_app/core/routers/routers_manager.dart';
import 'package:selaty_app/core/utils/resposive.dart';
import 'package:selaty_app/features/onboarding/data/models/onboarding_model.dart';

class CustomCricleButtonOnboarding extends StatelessWidget {
  const CustomCricleButtonOnboarding({
    super.key,
    required this.currentIndex,
    required this.onboradingInfo,
    required PageController controller,
  }) : _controller = controller;

  final int currentIndex;
  final List<OnboradingInfoModel> onboradingInfo;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (currentIndex == onboradingInfo.length - 1) {
          GoRouter.of(context).pushReplacement(RoutersManager.kAuthScreen);
        }
        _controller.nextPage(
          duration: Duration(milliseconds: 10),
          curve: Curves.bounceIn,
        );
      },
      child: Container(
        padding: EdgeInsets.all(12),
        width: context.height * 0.06,
        height: context.height * 0.06,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: onboradingInfo[currentIndex].color,
        ),
        child: Icon(CupertinoIcons.arrow_right,
            color: Colors.white, size: context.width > 600 ? 40 : 20),
      ),
    );
  }
}
