import 'package:graphql_example/constants/hive_constants.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
part 'country.g.dart';
@JsonSerializable()
@HiveType(typeId: HiveTypeIds.countryTypeId)
class Country {
  @JsonKey(name: "name")
  @HiveField(0)
  String name;
  @JsonKey(name: "code")
  @HiveField(1)
  String code;

  Country({required this.name, required this.code});

  factory Country.fromJson(Map<String, dynamic> json) => _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);
}
