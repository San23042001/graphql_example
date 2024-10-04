import 'package:dartz/dartz.dart';
import 'package:graphql_example/data/models/country.dart';

abstract class CountryRepository {
  Future<Either<String, List<Country>>> getCountry(
    String query,
    Map<String, dynamic> variables,
  );
}
