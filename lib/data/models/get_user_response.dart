import 'package:graphql_example/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'get_user_response.g.dart';

@JsonSerializable()
class GetUserResponse {
  @JsonKey(name: "getUsers")
  List<User> users;

  GetUserResponse({required this.users});

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);

}
