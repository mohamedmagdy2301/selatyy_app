import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          return SizedBox.shrink();
        }
        return Skeletonizer(
          effect: ShimmerEffect(
            baseColor: Colors.grey.shade400,
            highlightColor: Colors.grey.shade200,
            duration: Duration(seconds: 2),
          ),
          enabled: true,
          child: SliderHome(),
        );
      },
    );
  }
}
