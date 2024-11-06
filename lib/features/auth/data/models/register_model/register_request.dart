class RegisterRequest {
  final String mobile;
  final String name;
  final String email;
  final String password;
  final String cPassword;
  final String address;

  RegisterRequest({
    required this.mobile,
    required this.name,
    required this.email,
    required this.password,
    required this.cPassword,
    required this.address,
  });

  // Future<File> _getDefaultAvatarFile() async {
  //   final byteData = await rootBundle.load(kAvatarImageUrl);
  //   final tempDir = await getTemporaryDirectory();
  //   final file = File('${tempDir.path}/avatar.jpg');
  //   await file.writeAsBytes(byteData.buffer.asUint8List());
  //   return file;
  // }

  Future<Map<String, dynamic>> toJson() async {
    return {
      'mobile': mobile,
      'name': name,
      'email': email,
      'password': password,
      'c_password': cPassword,
      'address': address,
      // 'profile_photo_path': await MultipartFile.fromFile(file.path),
    };
  }
}
