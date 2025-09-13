class ProfileResponse {
  final String name;
  final String phone;
  final int avaterId;
  final String password;

  ProfileResponse({
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.password,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      name: json["data"]["name"],
      phone: json["data"]["phone"],
      avaterId: int.parse(json["data"]["avaterId"]),
      password: json["data"]["password"],
    );
  }
}
