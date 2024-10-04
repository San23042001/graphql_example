import 'dart:convert';

import 'package:graphql_example/core/api/graphql_baseurl.dart';
import 'package:graphql_example/core/error/exception.dart';
import 'package:graphql_example/logger.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';

String _h = 'graphql_client';

@lazySingleton
class GraphqlClient {
  late GraphQLClient _client;

  GraphqlClient(this._client);

  dynamic query(String query, {Map<String, dynamic>? variables}) async {
    final HttpLink httpLink = HttpLink(GraphqlBaseurl.countryApi);

    _client = GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));

    final options = QueryOptions(
      document: gql(query),
      variables: variables ?? {},
    );

    logInfo(_h, 'Query: $query  Variables: $variables');

    try {
      final result = await _client.query(options);
      final prettyResponse = _beautifyJson(result.data);
      logInfo(_h, 'Response : $prettyResponse');
      if (result.hasException) {
        throw ExceptionHandlers().getExceptionString(result.exception!);
      }
      return result.data;
    } catch (error) {
      logErrorObject(_h, error, error.toString());
      throw Exception();
    }
  }

  dynamic mutate(String mutation, {Map<String, dynamic>? variables}) async {
    final HttpLink httpLink = HttpLink(GraphqlBaseurl.countryApi);

    _client = GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));

    final options =
        MutationOptions(document: gql(mutation), variables: variables ?? {});

    logInfo(_h, 'Query: $query  Variables: $variables');

    try {
      final result = await _client.mutate(options);
      final prettyResponse = _beautifyJson(result.data);
      logInfo(_h, 'Response : $prettyResponse');
      if (result.hasException) {
        throw ExceptionHandlers().getExceptionString(result.exception!);
      }

      return result.data;
    } catch (e) {
      throw ExceptionHandlers().getExceptionString(e);
    }
  }
}

String _beautifyJson(Map<String, dynamic>? json) {
  if (json == null) {
    return 'null';
  }
  const encoder = JsonEncoder.withIndent('  ');
  return encoder.convert(json);
}
