import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/selaty%20app/selaty_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupServiceLocator();

  runApp(
    DevicePreview(
      builder: (context) {
        return const SelatyApp();
      },
    ),
  );
}


//  double height = MediaQuery.of(context).size.height;
        // double width = MediaQuery.of(context).size.width;
        // log("height: $height");
        // log("width: $width");
        // log("Device Type: ${Platform.operatingSystem}");