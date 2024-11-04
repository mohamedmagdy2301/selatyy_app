import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/decoration/decoration.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/slider_cubit/slider_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/slider_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildSliderHome extends StatelessWidget {
  const BuildSliderHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderSuccess) {
          return SliderHome(imgList: state.sliders);
        } else if (state is SliderFailure) {
          return const SizedBox.shrink();
        }
        return Skeletonizer(
          effect: shimmerEffect(),
          enabled: true,
          child: SliderHome(imgList: imgList),
        );
      },
    );
  }
}

List<SliderEntity> imgList = List.filled(7, SliderEntity(image: "30.jpg"));
