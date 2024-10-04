// import 'package:dartz/dartz.dart';
// import 'package:graphql_example/core/error/exception.dart';
// import 'package:graphql_example/core/error/failures.dart';
// import 'package:graphql_example/data/datasources/remote/character_remote_data_source.dart';
// import 'package:graphql_example/data/models/character_response_model.dart';
// import 'package:graphql_example/domain/repositories/character_repository.dart';
// import 'package:injectable/injectable.dart';

// @LazySingleton(as: CharacterRepository)
// class CharacterRepositoryImpl implements CharacterRepository {
//   final CharacterRemoteDataSource _characterRemoteDataSource;

//   CharacterRepositoryImpl(this._characterRemoteDataSource);

//   @override
//   Future<Either<Failure, CharacterResponseModel>> getCharacters(
//       ) async {
//     try {
//       final response = await _characterRemoteDataSource.getCharacters();
//       return Right(response);
//     } on ServerException {
//       return Left(ServerFailure());
//     }
//   }
// }
