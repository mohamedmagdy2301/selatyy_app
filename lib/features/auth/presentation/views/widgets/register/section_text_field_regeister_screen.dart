import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_text_feild.dart';
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
  bool isObscure = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: context.height * 0.022),
            CustomTextFeild(
              controller: name,
              labelText: StringsApp.nameUser,
              keyboardType: TextInputType.name,
            ),
            SizedBox(height: context.height * 0.018),
            CustomTextFeild(
              controller: phone,
              labelText: StringsApp.phone,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: context.height * 0.018),
            CustomTextFeild(
              controller: email,
              labelText: StringsApp.email,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: context.height * 0.018),
            CustomTextFeild(
              obscureText: isObscure,
              controller: password,
              labelText: StringsApp.password,
              keyboardType: TextInputType.visiblePassword,
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
            SizedBox(height: context.height * 0.018),
            CustomTextFeild(
              controller: address,
              labelText: StringsApp.address,
              keyboardType: TextInputType.streetAddress,
            ),
            SizedBox(height: context.height * 0.022),
            BuildRegisterCubitWidget(
              formKey: _formKey,
              name: name,
              phone: phone,
              email: email,
              password: password,
              address: address,
            ),
          ],
        ),
      ),
    );
  }
}
