import 'package:dartz/dartz.dart';
import 'package:graphql_example/core/api/graphql_call_with_error.dart';
import 'package:graphql_example/data/datasources/local/country_local_data_source.dart';

import 'package:graphql_example/data/datasources/remote/item_remote_data_sources.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/data/models/get_country_response_model.dart';
import 'package:graphql_example/domain/entities/app_error.dart';

import 'package:graphql_example/domain/repositories/item_repository.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ItemRepository)
class ItemRepositoryImpl implements ItemRepository {
  final ItemRemoteDataSource _remoteDataSource;
  final CountryLocalDataSource _countryLocalDataSource;

  ItemRepositoryImpl(this._remoteDataSource, this._countryLocalDataSource);
  @override
  Future<Either<AppError, List<Country>?>> getItems(
    String query,
    Map<String, dynamic> variables,
  ) async {
    return ApiCallWithError.call(() async {
      final GetCountryResponseModel countryResponseModel =
          await _remoteDataSource.getItems(query, variables);

      return countryResponseModel.country;
    });
  }

  @override
  Future<List<Country>?> fetchLocally() async {
    final country = await _countryLocalDataSource.getCountry();
    return country;
  }

  @override
  Future<void> saveLocally(List<Country>? country) async {
    await _countryLocalDataSource.cacheCountry(country!);
  }
}
