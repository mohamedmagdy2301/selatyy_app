import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/item_gridview.dart';

class SectionInfoAboutMe extends StatelessWidget {
  const SectionInfoAboutMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints for responsiveness
        int crossAxisCount;
        double childAspectRatio;

        // Increase crossAxisCount and set childAspectRatio based on screen width
        if (constraints.maxWidth >= 1400) {
          // Very large screen (e.g., large desktop)
          crossAxisCount = 8;
          childAspectRatio = 1;
        } else if (constraints.maxWidth >= 1200 ||
            constraints.maxWidth >= 800) {
          // tablet or Large screen (e.g., tablet or desktop)
          crossAxisCount = 4;
          childAspectRatio = 1;
        } else {
          // Small screen (e.g., mobile)
          crossAxisCount = 2;
          childAspectRatio = 3 / 2;
        }

        return GridView.builder(
          itemCount: 8,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: context.width * 0.1,
            vertical: context.height * 0.02,
          ),
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) {
            return const ItemGridviewProfile();
          },
        );
      },
    );
  }
}
