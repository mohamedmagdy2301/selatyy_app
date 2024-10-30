import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key, required this.imgList});
  final List<SliderEntity> imgList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: CarouselSlider.builder(
        options: CarouselOptions(
          height: context.height * 0.2,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInBack,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: imgList.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: "$kBaseUrlForImage${imgList[itemIndex].image}",
            placeholder: (context, url) {
              return Skeletonizer(
                effect: shimmerEffect(),
                enabled: true,
                child: Image.asset(
                  kSliderImage,
                  fit: BoxFit.fill,
                ),
              );
            },
            errorWidget: (context, url, error) {
              return Image.asset(kSliderImage, fit: BoxFit.fill);
            },
          ),
        ),
      ),
    );
  }
}
