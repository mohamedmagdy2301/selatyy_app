import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/selaty%20app/selaty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  // Hive.registerAdapter(MyObjectAdapter());

  await Hive.openBox(cartUsersBox);

  setupServiceLocator();
  await SharedPreferencesManager.sharedPreferencesInitialize();
  // FlutterError.onError = ErrorHandler.handleFlutterError;
  await SharedPreferencesManager.setData(key: nextPageKey, value: 2);
  runApp(const SelatyApp());
}
