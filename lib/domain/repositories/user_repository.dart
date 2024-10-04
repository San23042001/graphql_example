import 'package:dartz/dartz.dart';
import 'package:graphql_example/data/models/create_user_response.dart';
import 'package:graphql_example/data/models/get_user_response.dart';
import 'package:graphql_example/data/models/user_model.dart';

import 'package:graphql_example/domain/entities/app_error.dart';


abstract class UserRepository {
  Future<Either<AppError, GetUserResponse>> getUsers(
      String query, Map<String, dynamic> variables);
  Future<Either<AppError, User>> getUser(int id);
  Future<Either<AppError, CreateUserResponse>> createUser(
      String mutation, Map<String, dynamic> variables);
  Future<Either<AppError, User>> updateUser(int id, String name, String email);
  Future<Either<AppError, void>> deleteUser(
      String mutation, Map<String, dynamic> variables);
}
