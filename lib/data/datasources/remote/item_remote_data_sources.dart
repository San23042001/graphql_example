import 'package:graphql_example/core/api/graphql_client.dart';

import 'package:graphql_example/data/models/get_country_response_model.dart';
import 'package:injectable/injectable.dart';

abstract class ItemRemoteDataSource {
  Future<GetCountryResponseModel> getItems(
      String query, Map<String, dynamic> variables);
}

@LazySingleton(as: ItemRemoteDataSource)
class ItemRemoteDataSourceImpl implements ItemRemoteDataSource {
  final GraphqlClient _client;

  ItemRemoteDataSourceImpl(this._client);

  @override
  Future<GetCountryResponseModel> getItems(
      String query, Map<String, dynamic> variables) async {
    final result = await _client.query(query, variables: variables);

    return GetCountryResponseModel.fromJson(result);
  }
}
