import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/profile/presentation/views/widgets/item_gridview.dart';

class SectionInfoAboutMe extends StatelessWidget {
  const SectionInfoAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: 9,
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(
        horizontal: context.width * 0.08,
        vertical: context.height * 0.02,
      ),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 4 / 3,
      ),
      itemBuilder: (context, index) {
        return ItemGridviewProfile();
      },
    );
  }
}
