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
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          SizedBox(height: context.height * 0.022),
          CustomTextFeild(
            labelText: StringsApp.nameUser,
            controller: name,
            keyboardType: TextInputType.name,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.phone,
            controller: phone,
            keyboardType: TextInputType.phone,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.email,
            controller: email,
            keyboardType: TextInputType.emailAddress,
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.password,
            controller: password,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
            suffixIcon: const Icon(
              CupertinoIcons.eye_slash_fill,
              color: primaryDarkGrey,
            ),
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: 'العنوان',
            keyboardType: TextInputType.streetAddress,
            controller: address,
          ),
          SizedBox(height: context.height * 0.022),
          BuildRegisterCubitWidget(
            formKey: _formKey,
            registerRequest: RegisterRequest(
              mobile: phone.text.trim(),
              name: name.text.trim(),
              email: email.text.trim(),
              password: password.text.trim(),
              cPassword: password.text.trim(),
              address: address.text.trim(),
            ),
          ),
        ],
      ),
    );
  }
}
