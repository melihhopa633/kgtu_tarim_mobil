// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] == null
          ? null
          : AuthDataModel.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
      errors: json['errors'],
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'totalCount': instance.totalCount,
    };

AuthDataModel _$AuthDataModelFromJson(Map<String, dynamic> json) =>
    AuthDataModel(
      token: TokenDataModel.fromJson(json['token'] as Map<String, dynamic>),
      refreshToken: json['refreshToken'] as String,
    );

Map<String, dynamic> _$AuthDataModelToJson(AuthDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
    };

TokenDataModel _$TokenDataModelFromJson(Map<String, dynamic> json) =>
    TokenDataModel(
      token: json['token'] as String,
      expireDate: DateTime.parse(json['expireDate'] as String),
    );

Map<String, dynamic> _$TokenDataModelToJson(TokenDataModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'expireDate': instance.expireDate.toIso8601String(),
    };
