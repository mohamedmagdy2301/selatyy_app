import 'package:flutter/material.dart';
import 'package:selaty_app/core/enums/device_type_enum.dart';

extension SizeExtension on BuildContext {
  double get height => getDeviceHeight(MediaQuery.of(this));
  double get width => getDeviceWidth(MediaQuery.of(this));
  DeviceType get deviceType => getDeviceType(MediaQuery.of(this));
  double get textScale => width / 100;
  bool get isLandscape =>
      MediaQuery.of(this).orientation == Orientation.landscape;
}

DeviceType getDeviceType(MediaQueryData mediaQueryData) {
  Orientation orientation = mediaQueryData.orientation;
  double width = 0;
  if (orientation == Orientation.landscape) {
    width = mediaQueryData.size.height;
  } else {
    width = mediaQueryData.size.width;
  }
  if (width >= 950) {
    return DeviceType.desktop;
  } else if (width >= 600) {
    return DeviceType.tablet;
  } else {
    return DeviceType.mobile;
  }
}

double getDeviceHeight(MediaQueryData mediaQueryData) {
  if (mediaQueryData.orientation == Orientation.landscape) {
    return mediaQueryData.size.width;
  } else {
    return mediaQueryData.size.height;
  }
}

double getDeviceWidth(MediaQueryData mediaQueryData) {
  if (mediaQueryData.orientation == Orientation.landscape) {
    return mediaQueryData.size.height;
  } else {
    return mediaQueryData.size.width;
  }
}
