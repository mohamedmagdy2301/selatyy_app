import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/features/home/domain/entities/slider_entity.dart';
import 'package:selaty/features/home/presentation/view%20model/slider_cubit/slider_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/slider_home.dart';
import 'package:skeletonizer/skeletonizer.dart';

class BuildSliderHome extends StatefulWidget {
  const BuildSliderHome({super.key});

  @override
  State<BuildSliderHome> createState() => _BuildSliderHomeState();
}

class _BuildSliderHomeState extends State<BuildSliderHome> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderCubit, SliderState>(
      builder: (context, state) {
        if (state is SliderSuccess) {
          return SliderHome(imgList: state.sliders);
        } else if (state is SliderFailure) {
          return Text(state.message);
        }
        return Skeletonizer(
            effect: ShimmerEffect(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade200,
              duration: Duration(seconds: 2),
            ),
            enabled: true,
            child: SliderHome(imgList: imagesList));
      },
    );
  }

  List<SliderEntity> imagesList = List.filled(
    0,
    SliderEntity(
      image:
          "https://img-s-msn-com.akamaized.net/tenant/amp/entityid/BB1msBaF.img",
    ),
  );
}
