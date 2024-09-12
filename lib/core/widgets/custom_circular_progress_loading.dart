import 'package:flutter/material.dart';

class CustomCircularProgressLoading extends StatelessWidget {
  const CustomCircularProgressLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Center(
        child: CircularProgressIndicator(
          color: Color.fromARGB(255, 255, 255, 255),
          strokeWidth: 3,
          backgroundColor: Color.fromARGB(255, 83, 83, 83),
          strokeAlign: 4,
        ),
      ),
    );
  }
}
