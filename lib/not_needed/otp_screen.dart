import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/utils/colors.dart';
import 'package:selaty/core/utils/resposive.dart';
import 'package:selaty/not_needed/otp/otp_input.dart';
import 'package:selaty/not_needed/otp/section_check_otp_screen.dart';
import 'package:selaty/not_needed/otp/section_resent_otp_screen.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryWhite,
      // appBar: const CustomAppbarAuth(
      //   iconRight: CupertinoIcons.camera_on_rectangle,
      // ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.width * 0.05),
        child: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.landscape) {
              return Center(
                child: SingleChildScrollView(
                  child: SizedBox(
                    width: context.width * 0.8,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionTitleOtpScreen(),
                        SizedBox(height: context.height * 0.001),
                        const OtpInput(),
                        SizedBox(height: context.height * 0.01),
                        const SectionResentOtpScreen(),
                        SizedBox(height: context.height * 0.055),
                      ],
                    ),
                  ),
                ),
              );
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SectionTitleOtpScreen(),
                  SizedBox(height: context.height * 0.05),
                  const OtpInput(),
                  SizedBox(height: context.height * 0.055),
                  const SectionResentOtpScreen(),
                  SizedBox(height: context.height * 0.055),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
