class SignInResponse {
  final String message;
  final String token;

  SignInResponse({required this.message, required this.token});

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(message: json["message"], token: json["data"]);
  }
}
