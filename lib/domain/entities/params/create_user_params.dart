import 'package:json_annotation/json_annotation.dart';
part 'create_user_params.g.dart';

@JsonSerializable()
class CreateUserParams {
  final String name;
  final String email;

  CreateUserParams({
    required this.name,
    required this.email,
  });

  factory CreateUserParams.fromJson(Map<String, dynamic> json) =>
      _$CreateUserParamsFromJson(json);

  Map<String, dynamic> toJson() => _$CreateUserParamsToJson(this);
}
