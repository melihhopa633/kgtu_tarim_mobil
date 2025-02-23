import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  final bool isSuccess;
  final AuthData? data;
  final String? message;
  final int statusCode;
  final dynamic errors;
  final int totalCount;

  LoginResponse({
    required this.isSuccess,
    this.data,
    this.message,
    required this.statusCode,
    this.errors,
    required this.totalCount,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class AuthData {
  final TokenData token;
  final String refreshToken;

  AuthData({required this.token, required this.refreshToken});

  factory AuthData.fromJson(Map<String, dynamic> json) =>
      _$AuthDataFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataToJson(this);
}

@JsonSerializable()
class TokenData {
  final String token;
  final DateTime expireDate;

  TokenData({required this.token, required this.expireDate});

  factory TokenData.fromJson(Map<String, dynamic> json) =>
      _$TokenDataFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataToJson(this);
}