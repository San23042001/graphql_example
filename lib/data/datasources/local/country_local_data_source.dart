import 'package:graphql_example/constants/hive_constants.dart';
import 'package:graphql_example/data/models/country.dart';
import 'package:graphql_example/logger.dart';
import 'package:hive/hive.dart';
import 'package:injectable/injectable.dart';

const String _h = 'country_local_data_source';

abstract class CountryLocalDataSource {
  Future<void> cacheCountry(List<Country> countryData);

  Future<void> deleteCountry();

  Future<List<Country>?> getCountry();
}

@LazySingleton(as: CountryLocalDataSource)
class CountryLocalDataSourceImpl implements CountryLocalDataSource {
  @override
  Future<void> cacheCountry(List<Country> countryData) async {
    logDebug(_h, 'cacheTags : $countryData');
    final Box countryBox = await Hive.openBox(HiveConstants.countryBoxName);
    return await countryBox.put(HiveConstants.countryKey, countryData);
  }

  @override
  Future<void> deleteCountry() async {
    logDebug(_h, 'Delete local Tags!');
    final box = await Hive.openBox(HiveConstants.countryBoxName);
    await box.delete(HiveConstants.countryKey);
  }

  @override
  Future<List<Country>?> getCountry() async {
    logDebug(_h, 'Get Cached Tags');
    final box = await Hive.openBox(HiveConstants.countryBoxName);
    return box.get(HiveConstants.countryKey);
  }
}
