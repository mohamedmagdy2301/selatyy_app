import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';

class CricleImageOnboarding extends StatelessWidget {
  const CricleImageOnboarding({
    super.key,
    required this.image,
    required this.color,
  });
  final String image;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(context.width * 0.05),
        padding: EdgeInsets.all(context.width * 0.08),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color.withOpacity(.1),
        ),
        child: Container(
          width: context.width * 0.8,
          height: context.width * 0.8,
          padding: EdgeInsets.all(context.width * 0.08),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.4),
          ),
          child: Container(
            padding: EdgeInsets.all(context.width * 0.095),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: Image.asset(
              image,
            ),
          ),
        ),
      ),
    );
  }
}
