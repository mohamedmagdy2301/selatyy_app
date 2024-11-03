class UserProfileEntity {
  final String? name;
  final String? mobile;
  final String? email;
  final dynamic profilePhotoPath;
  final String? address;
  final String? token;

  UserProfileEntity({
    required this.name,
    required this.mobile,
    required this.email,
    required this.profilePhotoPath,
    required this.address,
    required this.token,
  });
}
