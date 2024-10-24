class LoginRequest {
  final String phoneEmail;
  final String password;

  LoginRequest({
    required this.phoneEmail,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
        'phone_email': phoneEmail,
        'password': password,
      };
}
