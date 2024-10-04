// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserParams _$CreateUserParamsFromJson(Map<String, dynamic> json) =>
    CreateUserParams(
      name: json['name'] as String,
      email: json['email'] as String,
    );

Map<String, dynamic> _$CreateUserParamsToJson(CreateUserParams instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
    };
