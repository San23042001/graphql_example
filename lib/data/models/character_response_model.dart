import 'package:json_annotation/json_annotation.dart';
part 'character_response_model.g.dart';
@JsonSerializable()
class CharacterResponseModel {
  @JsonKey(name: "characters")
  List<Results>? results;
  CharacterResponseModel({required this.results});
  factory CharacterResponseModel.fromJson(Map<String, dynamic> json) => _$CharacterResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CharacterResponseModelToJson(this);

}

@JsonSerializable()
class Results {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'species')
  String? species;
  @JsonKey(name: 'episode')
  List<Episode>? episode;
  Results(
      {required this.id,
      required this.name,
      required this.species,
      required this.episode});
  factory Results.fromJson(Map<String, dynamic> json) =>
      _$ResultsFromJson(json);

  Map<String, dynamic> toJson() => _$ResultsToJson(this);
}

@JsonSerializable()
class Episode {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "episode")
  String? episode;

  Episode({required this.id, required this.episode, this.name});

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);

  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
