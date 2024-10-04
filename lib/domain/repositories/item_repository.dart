import 'package:dartz/dartz.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/domain/entities/app_error.dart';

abstract class ItemRepository {
  Future<Either<AppError, List<Country>?>> getItems(
    String query,
    Map<String, dynamic> variables,
  );

  Future<void> saveLocally(List<Country>? country);

  Future<List<Country>?> fetchLocally();
}
