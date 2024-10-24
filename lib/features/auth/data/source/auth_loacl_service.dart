import 'package:selaty/core/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';

abstract class AuthLoaclService {
  Future<bool> isLoggedIn();
}

class AuthLoaclServiceImpl extends AuthLoaclService {
  @override
  Future<bool> isLoggedIn() async {
    String? token = await SharedPreferencesManager.getData(key: tokenKey) ?? "";
    if (token != "") {
      return true;
    }
    return false;
  }
}
