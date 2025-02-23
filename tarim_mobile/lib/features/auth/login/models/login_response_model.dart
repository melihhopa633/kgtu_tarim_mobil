import 'package:json_annotation/json_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final bool isSuccess;
  final AuthDataModel? data;
  final String? message;
  final int statusCode;
  final dynamic errors;
  final int totalCount;

  LoginResponseModel({
    required this.isSuccess,
    this.data,
    this.message,
    required this.statusCode,
    this.errors,
    required this.totalCount,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseModelToJson(this);
}

@JsonSerializable()
class AuthDataModel {
  final TokenDataModel token;
  final String refreshToken;

  AuthDataModel({required this.token, required this.refreshToken});

  factory AuthDataModel.fromJson(Map<String, dynamic> json) =>
      _$AuthDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AuthDataModelToJson(this);
}

@JsonSerializable()
class TokenDataModel {
  final String token;
  final DateTime expireDate;

  TokenDataModel({required this.token, required this.expireDate});

  factory TokenDataModel.fromJson(Map<String, dynamic> json) =>
      _$TokenDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDataModelToJson(this);
}