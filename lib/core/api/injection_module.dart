import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:graphql_example/core/api/graphql_baseurl.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

@module
abstract class InjectionModule {
  @lazySingleton
  Connectivity connectivity() => Connectivity();
  @lazySingleton
  InternetConnectionChecker get connectionChecker =>
      InternetConnectionChecker();

  @lazySingleton
  GraphQLClient graphQLClient() {
    final HttpLink httpLink = HttpLink(
      GraphqlBaseurl.countryApi,
    );

    return GraphQLClient(
        link: httpLink, cache: GraphQLCache(store: InMemoryStore()));
  }
}
