import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty_app/core/utils/colors.dart';
import 'package:selaty_app/features/home/presentation/views/widgets/custom_textfield_search.dart';

class SectionSearchHome extends StatelessWidget {
  const SectionSearchHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 8),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            padding: EdgeInsets.zero,
            icon: Icon(
              CupertinoIcons.square_list_fill,
              size: 60,
              color: primaryRed,
            ),
          ),
          Expanded(
            child: CustomTextFieldSearch(),
          ),
        ],
      ),
    );
  }
}