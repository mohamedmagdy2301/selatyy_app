import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/widgets/button_loading.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/core/widgets/custom_toast_massage.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/presentation/view_model/register_cubit/register_cubit_cubit.dart';

class BuildRegisterCubitWidget extends StatelessWidget {
  const BuildRegisterCubitWidget({
    super.key,
    required this.formKey,
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
    required this.address,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController name;
  final TextEditingController phone;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController address;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterCubitState>(
      listener: (context, state) {
        if (state is RegisterCubitSuccess) {
          showToast(
            context,
            text: StringsApp.doneRegister,
            color: primaryGreen,
            icon: Icons.check,
          );
          GoRouter.of(context).pushReplacement(RoutersManager.kLoginScreen);
        }
        if (state is RegisterCubitFailure) {
          showToast(
            context,
            text: state.errorMassage.split(".").first,
            color: primaryRed,
            icon: Icons.error_outline_outlined,
          );
        }
      },
      builder: (context, state) {
        if (state is RegisterCubitLoading) {
          return const ButtonLoading();
        }
        return CustomButton(
          titleButton: StringsApp.submitRegister,
          colorButton: primaryGreen,
          onTap: () {
            if (formKey.currentState?.validate() ?? false) {
              formKey.currentState?.save();

              final registerRequest = RegisterRequest(
                mobile: phone.text.trim(),
                name: name.text.trim(),
                email: email.text.trim(),
                password: password.text.trim(),
                cPassword: password.text.trim(),
                address: address.text.trim(),
              );

              context.read<RegisterCubit>().register(
                    registerRequest: registerRequest,
                  );
            }
            hideKeybourd();
          },
        );
      },
    );
  }
}
