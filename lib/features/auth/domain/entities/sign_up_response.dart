class SignUpResponse {
  final String name;
  final String password;
  final String phone;
  final String email;

  const SignUpResponse({
    required this.name,
    required this.password,
    required this.phone,
    required this.email,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      name: json["data"]["name"],
      password: json["data"]["password"],
      phone: json["data"]["phone"],
      email: json["data"]["email"],
    );
  }
}
