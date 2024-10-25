class UserProfileEntity {
  final String? name;
  final String? mobile;
  final String? profilePhotoUrl;
  final String? address;
  final String? token;

  UserProfileEntity(
      {required this.name,
      required this.mobile,
      required this.profilePhotoUrl,
      required this.address,
      required this.token});
}
