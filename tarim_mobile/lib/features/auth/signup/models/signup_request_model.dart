import 'package:json_annotation/json_annotation.dart';

part 'signup_request_model.g.dart';

@JsonSerializable()
class SignupRequestModel {
  @JsonKey(name: 'userName')
  final String userName;
  
  @JsonKey(name: 'email')
  final String email;
  
  @JsonKey(name: 'phoneNumber')
  final String phoneNumber;
  
  @JsonKey(name: 'password')
  final String password;
  
  @JsonKey(name: 'firstName')
  final String firstName;
  
  @JsonKey(name: 'lastName')
  final String lastName;
  
  @JsonKey(name: 'citizenId')
  final String citizenId;
  
  @JsonKey(name: 'birthDate')
  final DateTime birthDate;
  
  @JsonKey(name: 'birthPlace')
  final String birthPlace;
  
  @JsonKey(name: 'fullAddress')
  final String fullAddress;

  SignupRequestModel({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.citizenId,
    required this.birthDate,
    required this.birthPlace,
    required this.fullAddress,
  });

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SignupRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestModelToJson(this);
}