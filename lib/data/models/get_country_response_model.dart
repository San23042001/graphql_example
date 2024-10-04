import 'package:graphql_example/data/models/country.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_country_response_model.g.dart';

@JsonSerializable()
class GetCountryResponseModel {
  @JsonKey(name: 'countries')
  List<Country>? country;
  GetCountryResponseModel({required this.country});
  factory GetCountryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetCountryResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$GetCountryResponseModelToJson(this);
}
