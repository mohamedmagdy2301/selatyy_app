class UpdateProfileRequest {
  final String mobile;
  final String name;
  final String email;

  final String address;

  UpdateProfileRequest({
    required this.mobile,
    required this.name,
    required this.email,
    required this.address,
  });

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'name': name,
        'email': email,
        'address': address,
      };
}
