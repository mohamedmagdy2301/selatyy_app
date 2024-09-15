import 'package:flutter/material.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/features/profile/presentation/views/widgets/item_help_center.dart';
import 'package:selaty/features/profile/presentation/views/widgets/item_log_out.dart';

class SectionLogAndHelp extends StatelessWidget {
  const SectionLogAndHelp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemLogOutProfile(),
        SizedBox(width: context.width * 0.04),
        ItemCenterHelpProfile(),
      ],
    );
  }
}
