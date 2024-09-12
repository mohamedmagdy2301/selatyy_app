import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/resposive.dart';

class SecationAbsCardHome extends StatelessWidget {
  const SecationAbsCardHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.2,
      margin: EdgeInsets.symmetric(
        horizontal:
            context.isLandscape ? context.width * 0.4 : context.width * 0.02,
        vertical: context.height * 0.02,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/fruits_category.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
