import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/core/widgets/custom_toast_massage.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/presentation/view_model/register_cubit/register_cubit_cubit.dart';

class BuildRegisterCubitWidget extends StatelessWidget {
  const BuildRegisterCubitWidget(
      {super.key,
      required this.formKey,
      required this.autovalidateMode,
      required this.registerRequest});
  final GlobalKey<FormState> formKey;
  final AutovalidateMode autovalidateMode;
  final RegisterRequest registerRequest;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          showToast(
            context,
            text: "تم الأشتراك",
            color: primaryGreen,
            icon: Icons.check,
          );
        } else if (state is RegisterCubitFailure) {
          showToast(
            context,
            text: state.errorMassage.split(".").first,
            color: primaryRed,
            icon: Icons.error_outline_outlined,
          );
        } else {}
      },
      builder: (context, state) {
        if (state is RegisterCubitLoading) {
          return Container(
            alignment: Alignment.center,
            width: context.width * 0.9,
            height: context.height * 0.06,
            decoration: BoxDecoration(
              color: primaryGreen,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: context.width * 0.05,
              height: context.width * 0.05,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(primaryWhite),
              ),
            ),
          );
        }
        return CustomButton(
          titleButton: StringsApp.submitRegister,
          colorButton: primaryGreen,
          onTap: () {
            if (formKey.currentState?.validate() ?? false) {
              formKey.currentState?.save();

              BlocProvider.of<RegisterCubit>(context).register(
                registerRequest: registerRequest,
              );

              // GoRouter.of(context).pushReplacement(
              //     RoutersManager.kMainScaffoldScreen);
            }
            hideKeybourd();
          },
        );
      },
    );
  }
}
