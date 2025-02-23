import 'package:json_annotation/json_annotation.dart';

part 'signup_response_model.g.dart';

@JsonSerializable()
class SignupResponseModel {
  @JsonKey(name: 'isSuccess')
  final bool isSuccess;
  
  @JsonKey(name: 'data')
  final String? data;
  
  @JsonKey(name: 'message')
  final String? message;
  
  @JsonKey(name: 'statusCode')
  final int statusCode;
  
  @JsonKey(name: 'errors')
  final dynamic errors;
  
  @JsonKey(name: 'totalCount')
  final int totalCount;

  SignupResponseModel({
    required this.isSuccess,
    this.data,
    this.message,
    required this.statusCode,
    this.errors,
    required this.totalCount,
  });

  factory SignupResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$SignupResponseModelToJson(this);
}