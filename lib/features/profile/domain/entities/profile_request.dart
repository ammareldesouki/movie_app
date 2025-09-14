class GetProfileRequest {
  final String Token;

  GetProfileRequest(this.Token);

  Map<String, dynamic> toJson() {
    return {"Token": Token};
  }
}
