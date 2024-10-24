class RegisterResponse {
  bool status;
  String? errorMessage;
  RegisterData? data;

  RegisterResponse({
    required this.status,
    this.errorMessage,
    this.data,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) =>
      RegisterResponse(
        status: json['status'],
        errorMessage: json['error_message'] as String?,
        data: json['data'] == null
            ? null
            : RegisterData.fromJson(json['data'] as Map<String, dynamic>),
      );
}

class RegisterData {
  String? mobile;
  String? name;
  String? email;
  String? address;
  dynamic profilePhotoPath;
  String? token;

  RegisterData({
    this.mobile,
    this.name,
    this.email,
    this.address,
    this.profilePhotoPath,
    this.token,
  });

  factory RegisterData.fromJson(Map<String, dynamic> json) => RegisterData(
        mobile: json['mobile'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        address: json['address'] as String?,
        profilePhotoPath: json['profile_photo_path'] as dynamic,
        token: json['token'] as String?,
      );
}
