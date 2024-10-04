import 'package:dartz/dartz.dart';
import 'package:graphql_example/core/error/failures.dart';
import 'package:graphql_example/core/usecase.dart/usecase.dart';
import 'package:graphql_example/data/models/character_response_model.dart';
import 'package:graphql_example/domain/repositories/character_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetCharacterUsecase extends UseCase<CharacterResponseModel, NoParams> {
  final CharacterRepository _characterRepository;

  GetCharacterUsecase(this._characterRepository);
  @override
  Future<Either<Failure, CharacterResponseModel>> call(NoParams params) {
    return _characterRepository.getCharacters();
  }
}

class NoParams {}
