import 'dart:developer';

import 'package:selaty/core/constants/constants.dart';
import 'package:selaty/core/local_storage/shared_preferences_manager.dart';
import 'package:selaty/features/auth/data/models/login_model/login_response.dart';
import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';

abstract class AuthLocalService {
  Future<bool> isLoggedIn();
  Future<UserProfileEntity> userProfile();
}

class AuthLocalServiceImpl extends AuthLocalService {
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
    String name = await SharedPreferencesManager.getData(key: nameKey) ?? "";
    String phone = await SharedPreferencesManager.getData(key: phoneKey) ?? "";
    String address =
        await SharedPreferencesManager.getData(key: addressKey) ?? "";
    String image = await SharedPreferencesManager.getData(key: imageKey) ?? "";
    String token = await SharedPreferencesManager.getData(key: tokenKey) ?? "";
    String email = await SharedPreferencesManager.getData(key: emailKey) ?? "";

    UserProfileEntity userProfileEntity = LoginData(
      name: name,
      mobile: phone,
      email: email,
      address: address,
      token: token,
      profilePhotoPath: image,
    );
    return userProfileEntity;
  }
}
