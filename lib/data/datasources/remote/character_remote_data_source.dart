
import 'package:graphql_example/core/api/graphql_client.dart';
import 'package:graphql_example/core/error/graphql_exception.dart';
import 'package:graphql_example/data/models/character_response_model.dart';
import 'package:graphql_example/domain/entities/queries.dart';
import 'package:graphql_example/logger.dart';

import 'package:injectable/injectable.dart';

abstract class CharacterRemoteDataSource {
  Future<CharacterResponseModel> getCharacters();
}

@LazySingleton(as: CharacterRemoteDataSource)
class CharacterRemoteDataSourceImpl implements CharacterRemoteDataSource {
  final GraphqlClient _client;

  CharacterRemoteDataSourceImpl(this._client);
  @override
  Future<CharacterResponseModel> getCharacters() async {
    try {
      final result = await _client.query(Queries.charactersQuery);
      return result;
    } on Exception catch (exception) {
      logError("Expection", exception.toString());
      throw ServerException("message");
    }
  }
}
