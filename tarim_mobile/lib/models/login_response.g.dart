// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] == null
          ? null
          : AuthData.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
      errors: json['errors'],
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'totalCount': instance.totalCount,
    };

AuthData _$AuthDataFromJson(Map<String, dynamic> json) => AuthData(
      token: TokenData.fromJson(json['token'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthDataToJson(AuthData instance) => <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

TokenData _$TokenDataFromJson(Map<String, dynamic> json) => TokenData(
      token: json['token'] as String,
      expireDate: DateTime.parse(json['expireDate'] as String),
    );

Map<String, dynamic> _$TokenDataToJson(TokenData instance) => <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate.toIso8601String(),
    };
