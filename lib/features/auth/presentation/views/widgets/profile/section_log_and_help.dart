import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/custom_toast_massage.dart';
import 'package:selaty/features/auth/data/models/update_user_model/update_profile_request.dart';
import 'package:selaty/features/auth/presentation/view_model/update_user_profile_cubit/update_user_profile_cubit.dart';
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
                  strokeAlign: 10,
                  strokeWidth: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
                ),
              );
            }
            return GestureDetector(
              onTap: () {
                showDialogEditUserProfile(context);
              },
              child: const EditUserProfile(),
            );
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

  void showDialogEditUserProfile(BuildContext context) {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController addressController = TextEditingController();

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
              child: AlertDialog(
                title: Text('تعديل البيانات',
                    style: StylesManager.textStyle_14_bold(context).copyWith(
                      color: primaryBlack,
                    )),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      buildTextField('الاسم', nameController),
                      buildTextField('رقم الهاتف', phoneController),
                      buildTextField('البريد الإلكتروني', emailController),
                      buildTextField('العنوان', addressController),
                    ],
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: context.width * .09,
                  vertical: context.height * .02,
                ),
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
                      context.read<UpdateUserProfileCubit>().updateUserProfile(
                            param: UpdateProfileRequest(
                              mobile: phoneController.text.trim(),
                              name: nameController.text.trim(),
                              email: emailController.text.trim(),
                              address: addressController.text.trim(),
                            ),
                          );
                      Navigator.of(context).pop();
                    },
                    child: Text(
                      'حفظ التغييرات',
                      style: StylesManager.textStyle_9_bold(context).copyWith(
                        color: primaryGreen,
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
          curve: Curves.ease,
        );
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 1),
            end: Offset.zero,
          ).animate(curvedAnimation),
          child: child,
        );
      },
    );
  }

  Widget buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 15),
        ),
      ),
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
