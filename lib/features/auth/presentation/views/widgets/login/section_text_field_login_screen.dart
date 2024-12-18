import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/functions.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/utils/text_styles.dart';
import 'package:selaty/core/widgets/button_loading.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/core/widgets/custom_text_feild.dart';
import 'package:selaty/core/widgets/custom_toast_massage.dart';
import 'package:selaty/features/auth/data/models/login_model/login_request.dart';
import 'package:selaty/features/auth/presentation/view_model/login_cubit/login_cubit.dart';

class SectionTextFeildLoginScreen extends StatefulWidget {
  const SectionTextFeildLoginScreen({super.key});

  @override
  State<SectionTextFeildLoginScreen> createState() =>
      _SectionTextFeildLoginScreenState();
}

class _SectionTextFeildLoginScreenState
    extends State<SectionTextFeildLoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: context.height * 0.018),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFeild(
              labelText: StringsApp.email,
              controller: email,
            ),
          ),
          SizedBox(height: context.height * 0.018),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomTextFeild(
              controller: password,
              obscureText: isObscure,
              labelText: StringsApp.password,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure
                      ? CupertinoIcons.eye_slash_fill
                      : CupertinoIcons.eye_fill,
                  color: primaryDarkGrey,
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * 0.01),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextButton(
              onPressed: () {
                GoRouter.of(context).push(RoutersManager.kChangePasswordScreen);
              },
              child: Text(
                StringsApp.forgetPassword,
                style: StylesManager.textStyle_10_Medium(context).copyWith(
                  color: primaryDarkGrey,
                ),
              ),
            ),
          ),
          SizedBox(height: context.height * 0.025),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {
                showToast(
                  context,
                  text: StringsApp.doneRegister,
                  color: primaryGreen,
                  icon: Icons.check,
                );
                GoRouter.of(context)
                    .pushReplacement(RoutersManager.kMainScaffoldScreen);
              }
              if (state is LoginFailure) {
                showToast(
                  context,
                  text: state.errorMesssage.split(".").first,
                  color: primaryRed,
                  icon: Icons.error_outline_outlined,
                );
              }
            },
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: ButtonLoading());
              }
              return CustomButton(
                colorButton: primaryGreen,
                titleButton: StringsApp.loginAccount,
                onTap: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    _formKey.currentState?.save();
                    context.read<LoginCubit>().login(
                          param: LoginRequest(
                            phoneEmail: email.text.trim(),
                            password: password.text.trim(),
                          ),
                        );
                  }
                  hideKeyboard();
                },
              );
            },
          )
        ],
      ),
    );
  }
}
