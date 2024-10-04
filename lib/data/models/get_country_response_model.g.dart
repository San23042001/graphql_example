// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_country_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetCountryResponseModel _$GetCountryResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetCountryResponseModel(
      country: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetCountryResponseModelToJson(
        GetCountryResponseModel instance) =>
    <String, dynamic>{
      'countries': instance.country,
    };
