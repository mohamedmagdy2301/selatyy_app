import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:skeletonizer/skeletonizer.dart';

Decoration kBackgroundDecoration = const BoxDecoration(
    image: DecorationImage(
  image: AssetImage(kBackgroundImage),
  fit: BoxFit.fill,
  opacity: 0.86,
));

ShimmerEffect shimmerEffect() {
  return ShimmerEffect(
    baseColor: Colors.grey.shade300,
    highlightColor: Colors.grey.shade100,
    duration: Duration(seconds: 1),
  );
}
