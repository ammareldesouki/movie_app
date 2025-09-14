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
    // Access the nested 'data' map first for all user details

    return ProfileResponse(
      name: json['name'] as String,
      phone: json['phone'] as String,
      avaterId: json['avaterId'] as int,
      password: json['password'] as String,
    );
  }
}
