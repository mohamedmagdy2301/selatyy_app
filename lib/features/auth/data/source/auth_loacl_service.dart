import 'dart:developer';

import 'package:selaty/core/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';

abstract class AuthLoaclService {
  Future<bool> isLoggedIn();
  Future<UserProfileEntity> userProfile();
}

class AuthLoaclServiceImpl extends AuthLoaclService {
  @override
  Future<bool> isLoggedIn() async {
    String token = await SharedPreferencesManager.getData(key: tokenKey) ?? '';
    log(token);
    if (token != "") {
      return true;
    }
    return false;
  }

  @override
  Future<UserProfileEntity> userProfile() async {
    String name = await SharedPreferencesManager.getData(key: nameKey);
    String phone = await SharedPreferencesManager.getData(key: phoneKey);
    String address = await SharedPreferencesManager.getData(key: addressKey);
    String image = await SharedPreferencesManager.getData(key: imageKey);
    String token = await SharedPreferencesManager.getData(key: tokenKey);

    UserProfileEntity userProfileEntity = LoginData(
      name: name,
      mobile: phone,
      address: address,
      token: token,
      profilePhotoUrl: image,
    );
    log(userProfileEntity.toString());
    return userProfileEntity;
  }
}
