import 'package:dartz/dartz.dart';
import 'package:graphql_example/core/error/failures.dart';
import 'package:graphql_example/data/models/character_response_model.dart';

abstract class CharacterRepository {
  Future<Either<Failure, CharacterResponseModel>> getCharacters();
}
