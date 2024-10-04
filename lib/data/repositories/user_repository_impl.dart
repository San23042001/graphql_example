import 'package:dartz/dartz.dart';

import 'package:graphql_example/core/api/graphql_call_with_error.dart';
import 'package:graphql_example/data/datasources/remote/user_remote_data_sources.dart';
import 'package:graphql_example/data/models/create_user_response.dart';
import 'package:graphql_example/data/models/get_user_response.dart';
import 'package:graphql_example/data/models/user_model.dart';
import 'package:graphql_example/domain/entities/app_error.dart';

import 'package:graphql_example/domain/repositories/user_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _userRemoteDataSource;

  UserRepositoryImpl(this._userRemoteDataSource);

  @override
  Future<Either<AppError, CreateUserResponse>> createUser(
      String mutation, Map<String, dynamic> variables) {
    return ApiCallWithError.call(() async {
      final CreateUserResponse user = await _userRemoteDataSource.createUser(mutation, variables);
      return user;
    });
  }

  @override
  Future<Either<AppError, void>> deleteUser(
      String mutation, Map<String, dynamic> variables) {
    return ApiCallWithError.call(() async {
      await _userRemoteDataSource.deleteUser(mutation, variables);
    });
  }

  @override
  Future<Either<AppError, User>> getUser(int id) {
    // TODO: implement getUser
    throw UnimplementedError();
  }

  @override
  Future<Either<AppError, GetUserResponse>> getUsers(
      String query, Map<String, dynamic> variables) {
    return ApiCallWithError.call(() async {
      final GetUserResponse users =
          await _userRemoteDataSource.getUsers(query, variables);
      return users;
    });
  }

  @override
  Future<Either<AppError, User>> updateUser(int id, String name, String email) {
    // TODO: implement updateUser
    throw UnimplementedError();
  }
}
