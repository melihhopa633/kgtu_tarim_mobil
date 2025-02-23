// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResponseModel _$SignupResponseModelFromJson(Map<String, dynamic> json) =>
    SignupResponseModel(
      isSuccess: json['isSuccess'] as bool,
      data: json['data'] as String?,
      message: json['message'] as String?,
      statusCode: (json['statusCode'] as num).toInt(),
      errors: json['errors'],
      totalCount: (json['totalCount'] as num).toInt(),
    );

Map<String, dynamic> _$SignupResponseModelToJson(
        SignupResponseModel instance) =>
    <String, dynamic>{
      'isSuccess': instance.isSuccess,
      'data': instance.data,
      'message': instance.message,
      'statusCode': instance.statusCode,
      'errors': instance.errors,
      'totalCount': instance.totalCount,
    };
