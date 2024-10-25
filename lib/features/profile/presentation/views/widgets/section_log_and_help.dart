import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/routers/routers_manager.dart';
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
        EditUserProfile(),
        SizedBox(width: context.width * 0.04),
        GestureDetector(
            onTap: () {
              SharedPreferencesManager.setData(key: tokenKey, value: '');
              GoRouter.of(context).pushReplacement(RoutersManager.kAuthScreen);
            },
            child: ItemLogOutProfile()),
      ],
    );
  }
}
