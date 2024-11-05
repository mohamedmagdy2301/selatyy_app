import 'dart:io';

import 'package:dio/dio.dart';

class UpdateProfileRequest {
  final String mobile;
  final String name;
  final String email;
  final String address;
  final File profilePhoto;

  UpdateProfileRequest({
    required this.mobile,
    required this.name,
    required this.email,
    required this.address,
    required this.profilePhoto,
  });

  Future<Map<String, dynamic>> toJson() async => {
        'mobile': mobile,
        'name': name,
        'email': email,
        'address': address,
        "profile_photo_path": await MultipartFile.fromFile(profilePhoto.path),
      };
}
