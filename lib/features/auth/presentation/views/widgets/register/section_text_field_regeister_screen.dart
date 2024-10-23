import 'package:flutter/cupertino.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/core/utils/Strings_app.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/core/widgets/custom_button.dart';
import 'package:selaty/core/widgets/custom_text_feild.dart';
import 'package:selaty/features/auth/data/models/register_model/register_request.dart';
import 'package:selaty/features/auth/domain/usecases/register_usecase.dart';

class SectionTextFeildRegister extends StatefulWidget {
  const SectionTextFeildRegister({super.key});

  @override
  State<SectionTextFeildRegister> createState() =>
      _SectionTextFeildRegisterState();
}

class _SectionTextFeildRegisterState extends State<SectionTextFeildRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? name;
  String? phone;
  String? email;
  String? address;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextFeild(
            labelText: StringsApp.nameUser,
            obscureText: false,
            onSaved: (name) {
              this.name = name;
            },
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.phone,
            obscureText: false,
            onSaved: (phone) {
              this.phone = phone;
            },
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.email,
            obscureText: false,
            onSaved: (email) {
              this.email = email;
            },
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: StringsApp.password,
            obscureText: false,
            suffixIcon: Icon(
              CupertinoIcons.eye_slash_fill,
              color: primaryDarkGrey,
            ),
            onSaved: (password) {
              this.password = password;
            },
          ),
          SizedBox(height: context.height * 0.018),
          CustomTextFeild(
            labelText: 'العنوان',
            obscureText: false,
            onSaved: (address) {
              this.address = address;
            },
          ),
          SizedBox(height: context.height * 0.022),
          CustomButton(
            titleButton: StringsApp.submitRegister,
            colorButton: primaryGreen,
            onTap: () {
              if (_formKey.currentState?.validate() ?? false) {
                _formKey.currentState?.save();
                sl<RegisterUsecase>().call(
                  param: RegisterRequest(
                    mobile: phone!,
                    name: name!,
                    email: email!,
                    password: password!,
                    cPassword: password!,
                    address: address!,
                    profilePhotoPath: '',
                  ),
                );
              }
              // GoRouter.of(context).pushReplacement(
              //     RoutersManager.kMainScaffoldScreen);
            },
          ),
        ],
      ),
    );
  }
}
