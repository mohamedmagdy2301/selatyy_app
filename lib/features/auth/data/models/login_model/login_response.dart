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

class LoginData {
  int? id;
  String? name;
  String? mobile;
  String? email;
  int? roleId;
  String? address;
  dynamic profilePhotoPath;
  String? token;
  String? profilePhotoUrl;

  LoginData({
    this.id,
    this.name,
    this.mobile,
    this.email,
    this.roleId,
    this.address,
    this.profilePhotoPath,
    this.token,
    this.profilePhotoUrl,
  });

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
