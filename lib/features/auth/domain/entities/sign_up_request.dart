class SignUpRequest {
  final String name;
  final String email;
  final String password;
  final String phoneNumber;
  final String repassword;
  final int avaterId;

  SignUpRequest({
    required this.repassword, required this.avaterId,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
      "phone": phoneNumber,
      "confirmPassword": repassword,
      "avaterId": avaterId

    };
  }
}
