import 'package:flutter/material.dart';

class ErrorHandler {
  static void handleFlutterError(FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    runApp(ErrorWidgetApp(errorDetails: details));
  }
}

class ErrorWidgetApp extends StatelessWidget {
  final FlutterErrorDetails errorDetails;

  const ErrorWidgetApp({required this.errorDetails, super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Error Widget',
      home: CustomErrorWidget(
        errorMessage: errorDetails.exceptionAsString(),
      ),
    );
  }
}

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({required this.errorMessage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Error Occurred')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error, color: Colors.red, size: 80),
            const SizedBox(height: 16),
            const Text(
              'Error Occurred!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(errorMessage, textAlign: TextAlign.center),
            const SizedBox(height: 8),
            const Text(
                'please wait some time until  the error is resolved and try again later',
                textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}
