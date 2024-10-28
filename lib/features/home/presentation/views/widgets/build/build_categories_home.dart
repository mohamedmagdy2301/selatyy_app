import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/home/presentation/view%20model/categories_cubit/categories_cubit.dart';
import 'package:selaty/features/home/presentation/views/widgets/custom_loading_categories_card.dart';
import 'package:selaty/features/home/presentation/views/widgets/item_categories_home.dart';

class BuildCategoriesHome extends StatelessWidget {
  const BuildCategoriesHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccess) {
          return SizedBox(
            height: context.height * 0.15,
            child: ListView.builder(
              itemCount: state.categoriesList.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ItemCategoriesHome(
                  categories: state.categoriesList[index],
                );
              },
            ),
          );
        } else if (state is CategoriesFailure) {
          return SizedBox();
        }
        return CustomLoadingCategoriesCard();
      },
    );
  }
}
