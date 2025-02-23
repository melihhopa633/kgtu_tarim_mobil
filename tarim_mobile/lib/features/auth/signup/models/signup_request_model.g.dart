// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestModel _$SignupRequestModelFromJson(Map<String, dynamic> json) =>
    SignupRequestModel(
      userName: json['userName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      citizenId: json['citizenId'] as String,
      birthDate: DateTime.parse(json['birthDate'] as String),
      birthPlace: json['birthPlace'] as String,
      fullAddress: json['fullAddress'] as String,
    );

Map<String, dynamic> _$SignupRequestModelToJson(SignupRequestModel instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'citizenId': instance.citizenId,
      'birthDate': instance.birthDate.toIso8601String(),
      'birthPlace': instance.birthPlace,
      'fullAddress': instance.fullAddress,
    };
