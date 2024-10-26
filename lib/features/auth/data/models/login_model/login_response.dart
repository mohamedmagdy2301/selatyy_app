// ignore_for_file: overridden_fields

import 'package:selaty/features/auth/domain/entities/user_profile_entity.dart';

class LoginResponse {
  bool? status;
  String? message;
  LoginData? data;

  LoginResponse({this.status, this.message, this.data});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        data: json['data'] == null
            ? null
            : LoginData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class LoginData extends UserProfileEntity {
  int? id;
  @override
  String? name;
  @override
  String? mobile;

  @override
  String? email;
  int? roleId;
  @override
  String? address;
  dynamic profilePhotoPath;
  @override
  String? token;
  @override
  String? profilePhotoUrl;

  LoginData({
    this.id,
    required this.name,
    required this.mobile,
    this.email,
    this.roleId,
    required this.address,
    this.profilePhotoPath,
    required this.token,
    required this.profilePhotoUrl,
  }) : super(
          name: name,
          mobile: mobile,
          email: email,
          profilePhotoUrl: profilePhotoUrl,
          address: address,
          token: token,
        );

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        id: json['id'] as int?,
        name: json['name'] as String?,
        mobile: json['mobile'] as String?,
        email: json['email'] as String?,
        roleId: json['role_id'] as int?,
        address: json['address'] as String?,
        profilePhotoPath: json['profile_photo_path'] as dynamic,
        token: json['token'] as String?,
        profilePhotoUrl: json['profile_photo_url'] as String?,
      );
}
