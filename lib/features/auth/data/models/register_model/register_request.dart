class RegisterRequest {
  final String mobile;
  final String name;
  final String email;
  final String password;
  final String cPassword;
  final String address;
  final dynamic profilePhotoPath;

  RegisterRequest({
    required this.mobile,
    required this.name,
    required this.email,
    required this.password,
    required this.cPassword,
    required this.address,
    required this.profilePhotoPath,
  });

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'name': name,
        'email': email,
        'password': password,
        'c_password': cPassword,
        'address': address,
        'profile_photo_path': profilePhotoPath,
      };
}
