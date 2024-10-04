import 'package:dartz/dartz.dart';
import 'package:graphql_example/core/error/exception.dart';
import 'package:graphql_example/data/datasources/remote/item_remote_data_sources.dart';
import 'package:graphql_example/data/models/country.dart';
import 'package:graphql_example/data/models/get_country_response_model.dart';
import 'package:graphql_example/domain/repositories/country_repository.dart';
import 'package:graphql_example/logger.dart';

import 'package:injectable/injectable.dart';

@LazySingleton(as: CountryRepository)
class CountryRepositoryImpl implements CountryRepository {
  final ItemRemoteDataSource _itemRemoteDataSource;

  CountryRepositoryImpl(this._itemRemoteDataSource);
  @override
  Future<Either<String, List<Country>>> getCountry(
      String query, Map<String, dynamic> variables) async {
    try {
      final GetCountryResponseModel getCountryResponseModel =
          await _itemRemoteDataSource.getItems(query, variables);
      return Right(getCountryResponseModel.country!);
    } catch (e) {
      logError("Exception", e.toString());
      return Left(ExceptionHandlers().getExceptionString(e));
    }
  }
}
