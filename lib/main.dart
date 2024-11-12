import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/core/service_locator.dart';
import 'package:selaty/features/cart/data/models/cart_user_model.dart';
import 'package:selaty/selaty%20app/selaty_app.dart';
// import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // final appDocumentDir = await getApplicationDocumentsDirectory();
  // Hive.init(appDocumentDir.path);

  setupServiceLocator();
  await SharedPreferencesManager.sharedPreferencesInitialize();
  await Hive.initFlutter();
  Hive.registerAdapter(AllCartUserModelAdapter());
  Hive.registerAdapter(CartUserModelAdapter());
  Hive.registerAdapter(ProductCartAdapter());
  await Hive.openBox<AllCartUserModel>(cartUsersBox);
  // FlutterError.onError = ErrorHandler.handleFlutterError;
  await SharedPreferencesManager.setData(key: nextPageKey, value: 2);
  runApp(const SelatyApp());
}
