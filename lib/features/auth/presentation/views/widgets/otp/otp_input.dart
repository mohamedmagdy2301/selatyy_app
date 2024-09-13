import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:selaty/core/routers/routers_manager.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  TextEditingController textEditingController = TextEditingController();
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 4,
      obscureText: false,
      keyboardType: TextInputType.number,
      cursorHeight: 25,
      autoFocus: true,
      animationType: AnimationType.fade,
      enablePinAutofill: true,
      cursorWidth: 1.1,
      textStyle: const TextStyle(
        color: primaryWhite,
        fontSize: 35,
        fontWeight: FontWeight.w100,
      ),
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(10),
        borderWidth: 0,
        fieldHeight: context.height * 0.09,
        fieldWidth: context.height * 0.09,
        activeColor: Colors.transparent,
        inactiveColor: Colors.transparent,
        selectedColor: Colors.transparent,
        activeFillColor: primaryGreen,
        inactiveFillColor: primaryLightGrey,
        selectedFillColor: primaryRed,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      controller: textEditingController,
      onCompleted: (v) {
        debugPrint("Completed");

        GoRouter.of(context)
            .pushReplacement(RoutersManager.kMainScaffoldScreen);
      },
      onChanged: (value) {
        debugPrint(value);
        setState(() {
          currentText = value;
        });
      },
      beforeTextPaste: (text) {
        return true;
      },
      appContext: context,
    );
  }
}
// import 'dart:async';

// import 'package:flutter/material.dart';

// class OtpVerificationScreen extends StatefulWidget {
//   const OtpVerificationScreen({super.key});

//   @override
//   _OtpVerificationScreenState createState() => _OtpVerificationScreenState();
// }

// class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
//   final TextEditingController _otpController = TextEditingController();

//   final TextEditingController _fieldOne = TextEditingController();
//   final TextEditingController _fieldTwo = TextEditingController();
//   final TextEditingController _fieldThree = TextEditingController();
//   final TextEditingController _fieldFour = TextEditingController();

//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   bool _isResendButtonEnabled = false;
//   int _resendCountdown = 30;
//   Timer? _timer;

//   @override
//   void dispose() {
//     _otpController.dispose();
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startResendOtpCountdown() {
//     setState(() {
//       _isResendButtonEnabled = false;
//       _resendCountdown = 30;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         if (_resendCountdown > 0) {
//           _resendCountdown--;
//         } else {
//           _isResendButtonEnabled = true;
//           _timer?.cancel();
//         }
//       });
//     });
//   }

//   void _resendOtp() {
//     // Call your backend to resend the OTP
//     // Example: await apiService.resendOtp(phoneNumber);

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('OTP has been resent.')),
//     );

//     // Start the countdown again
//     _startResendOtpCountdown();
//   }

//   void _verifyOtp() {
//     () {
//       setState(() {
//         _fieldOne.text + _fieldTwo.text + _fieldThree.text + _fieldFour.text;
//       });
//     };
//     // if (_formKey.currentState?.validate() ?? false) {
//     //   String enteredOtp = _otpController.text.trim();
//     //   if (enteredOtp == "123456") {
//     //     ScaffoldMessenger.of(context).showSnackBar(
//     //       const SnackBar(content: Text('OTP verified successfully!')),
//     //     );
//     //   } else {
//     //     ScaffoldMessenger.of(context).showSnackBar(
//     //       const SnackBar(content: Text('Invalid OTP, please try again.')),
//     //     );
//     //   }
//     // }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _startResendOtpCountdown();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('OTP Verification'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignmentaceEvenly,
//                 children: [
//                   OtpInput(_fieldOne, true), // auto focus
//                   OtpInput(_fieldTwo, false),
//                   OtpInput(_fieldThree, false),
//                   OtpInput(_fieldFour, false)
//                 ],
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _verifyOtp,
//                 child: const Text('Verify OTP'),
//               ),
//               const SizedBox(height: 20),
//               TextButton(
//                 onPressed: _isResendButtonEnabled ? _resendOtp : null,
//                 child: Text(
//                   _isResendButtonEnabled
//                       ? 'Resend OTP'
//                       : 'Resend OTP in $_resendCountdown seconds',
//                   style: TextStyle(
//                     color: _isResendButtonEnabled ? Colors.blue : Colors.grey,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class OtpInput extends StatelessWidget {
//   final TextEditingController controller;
//   final bool autoFocus;
//   const OtpInput(this.controller, this.autoFocus, {super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 60,
//       width: 50,
//       child: TextField(
//         autofocus: autoFocus,
//         textAlign: TextAlign.center,
//         keyboardType: TextInputType.number,
//         controller: controller,
//         maxLength: 1,
//         cursorColor: Theme.of(context).primaryColor,
//         decoration: const InputDecoration(
//             border: OutlineInputBorder(),
//             counterText: '',
//             hintStyle: TextStyle(color: Colors.black, fontSize: 20.0)),
//         onChanged: (value) {
//           if (value.length == 1) {
//             FocusScope.of(context).nextFocus();
//           }
//         },
//       ),
//     );
//   }
// }
