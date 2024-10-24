import 'package:flutter/cupertino.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_text_feild.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/presentation/views/widgets/register/build_register_cubit_widget.dart';

class SectionTextFeildRegister extends StatefulWidget {
  const SectionTextFeildRegister({super.key});

  @override
  State<SectionTextFeildRegister> createState() =>
      _SectionTextFeildRegisterState();
}

class _SectionTextFeildRegisterState extends State<SectionTextFeildRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController name = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: _formKey.currentState?.validate() ?? false
          ? AutovalidateMode.disabled
          : AutovalidateMode.always,
      child: Column(
        children: [
          CustomTextFeild(
            labelText: StringsApp.nameUser,
            controller: name,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.phone,
            controller: phone,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.email,
            controller: email,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.password,
            obscureText: true,
            suffixIcon: Icon(
              CupertinoIcons.eye_slash_fill,
              color: primaryDarkGrey,
            ),
            controller: password,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: 'العنوان',
            controller: address,
          ),
          SizedBox(height: context.height * 0.022),
          BuildRegisterCubitWidget(
            formKey: _formKey,
            registerRequest: RegisterRequest(
              mobile: phone.text,
              name: name.text,
              email: email.text,
              password: password.text,
              cPassword: password.text,
              address: address.text,
              profilePhotoPath: '',
            ),
          ),
        ],
      ),
    );
  }
}
