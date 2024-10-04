import 'package:graphql_example/data/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'create_user_response.g.dart';

@JsonSerializable()
class CreateUserResponse {
  @JsonKey(name: 'createUser')
  User user;
  CreateUserResponse({required this.user});
    factory CreateUserResponse.fromJson(Map<String, dynamic> json) => _$CreateUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserResponseToJson(this);
}
