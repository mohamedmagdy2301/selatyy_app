import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';

class ButtonLoading extends StatelessWidget {
  const ButtonLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.width * 0.9,
      height: context.height * 0.06,
      decoration: BoxDecoration(
        color: primaryGreen,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: context.width * 0.05,
        height: context.width * 0.05,
        child: const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
        ),
      ),
    );
  }
}
