import 'package:graphql_example/core/api/graphql_client.dart';
import 'package:graphql_example/data/models/create_user_response.dart';
import 'package:graphql_example/data/models/get_user_response.dart';

import 'package:injectable/injectable.dart';

abstract class UserRemoteDataSource {
  Future<GetUserResponse> getUsers(
      String query, Map<String, dynamic> variables);
  Future<CreateUserResponse> createUser(
      String mutation, Map<String, dynamic> variables);
  Future<void> deleteUser(String mutation, Map<String, dynamic> variables);
}

@LazySingleton(as: UserRemoteDataSource)
class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final GraphqlClient _client;

  UserRemoteDataSourceImpl(this._client);

  @override
  Future<GetUserResponse> getUsers(
      String query, Map<String, dynamic> variables) async {
    final response = await _client.query(query, variables: variables);
    return GetUserResponse.fromJson(response);
  }

  @override
  Future<CreateUserResponse> createUser(
      String mutation, Map<String, dynamic> variables) async {
    final response = await _client.mutate(mutation, variables: variables);

    return CreateUserResponse.fromJson(response);
  }

  @override
  Future<void> deleteUser(
      String mutation, Map<String, dynamic> variables) async {
    await _client.mutate(mutation, variables: variables);
  }
}
