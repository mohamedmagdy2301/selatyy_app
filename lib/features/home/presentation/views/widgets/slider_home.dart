import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';

class SliderHome extends StatelessWidget {
  const SliderHome({super.key, this.imgList});
  final List<SliderEntity>? imgList;

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
          autoPlay: imgList != null,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.easeInBack,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: imgList?.length ?? 4,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: imgList == null
              ? Image.asset(
                  'assets/images/fruits_category.jpg',
                  fit: BoxFit.fill,
                )
              : CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: imgList![itemIndex].image,
                  placeholder: (context, url) => SizedBox(),
                  errorWidget: (context, url, error) => SizedBox(),
                ),
        ),
      ),
    );
  }
}
