import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_toast_massage.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';
import 'package:selaty/features/auth/presentation/view_model/update_user_profile_cubit/update_user_profile_cubit.dart';
import 'package:selaty/features/auth/presentation/view_model/view_user_profile_cubit/view_user_profile_cubit.dart';
import 'package:selaty/features/auth/presentation/views/screens/edit_user_profile_screen.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/item_help_center.dart';
import 'package:selaty/features/auth/presentation/views/widgets/profile/item_log_out.dart';

class SectionLogAndHelp extends StatelessWidget {
  const SectionLogAndHelp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocConsumer<UpdateUserProfileCubit, UpdateUserProfileState>(
          listener: (context, state) {
            if (state is UpdateUserProfileSuccess) {
              showToast(
                context,
                text: state.message,
                color: primaryGreen,
                icon: Icons.check,
              );
              GoRouter.of(context).pushReplacement(RoutersManager.kLoginScreen);
            }
            if (state is UpdateUserProfileFailure) {
              showToast(
                context,
                text: state.message.split(".").first,
                color: primaryRed,
                icon: Icons.error_outline_outlined,
              );
            }
          },
          builder: (context, state) {
            if (state is UpdateUserProfileLoading) {
              return Container(
                width: context.width * 0.4,
                height: context.height * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryGreen,
                ),
                alignment: Alignment.center,
                child: const CircularProgressIndicator(
                  strokeAlign: 5.5,
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
                ),
              );
            }
            return BlocBuilder<ViewUserProfileCubit, ViewUserProfileState>(
                builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  PersistentNavBarNavigator.pushNewScreen(
                    context,
                    withNavBar: true,
                    screen: EditUserProfileScreen(
                      userProfileEntity: state is ViewUserProfileDone
                          ? state.userProfileInfo
                          : UserProfileEntity(
                              name: '',
                              mobile: '',
                              email: '',
                              profilePhotoPath: '',
                              address: '',
                              token: '',
                            ),
                    ),
                    pageTransitionAnimation: PageTransitionAnimation.cupertino,
                  );
                },
                child: const EditUserProfile(),
              );
            });
          },
        ),
        SizedBox(width: context.width * 0.04),
        GestureDetector(
          onTap: () {
            showDialogLogOut(context);
          },
          child: const ItemLogOutProfile(),
        ),
      ],
    );
  }

  void showDialogLogOut(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 300),
      pageBuilder: (context, animation, secondaryAnimation) {
        return Center(
          child: Material(
            color: Colors.transparent,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.symmetric(horizontal: context.width * 0.08),
              child: AlertDialog(
                title: Text('تسجيل الخروج',
                    style: StylesManager.textStyle_14_bold(context).copyWith(
                      color: primaryBlack,
                    )),
                content: Text('هل أنت متأكد أنك تريد تسجيل الخروج؟',
                    style: StylesManager.textStyle_11_bold(context).copyWith(
                      color: primaryBlack,
                    )),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 35, vertical: 30),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'إلغاء',
                      style: StylesManager.textStyle_9_bold(context).copyWith(
                        color: primaryBlack,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      clearCachUserProfileToLogOut();
                      GoRouter.of(context)
                          .pushReplacement(RoutersManager.kAuthScreen);
                    },
                    child: Text(
                      'تسجيل الخروج',
                      style: StylesManager.textStyle_9_bold(context).copyWith(
                        color: primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.linear,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(-1, 1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  void clearCachUserProfileToLogOut() {
    SharedPreferencesManager.removeData(key: tokenKey);
    SharedPreferencesManager.removeData(key: nameKey);
    SharedPreferencesManager.removeData(key: addressKey);
    SharedPreferencesManager.removeData(key: emailKey);
    SharedPreferencesManager.removeData(key: phoneKey);
    SharedPreferencesManager.removeData(key: imageKey);
  }
}
