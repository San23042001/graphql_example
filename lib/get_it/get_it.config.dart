// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:graphql_flutter/graphql_flutter.dart' as _i128;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i973;

import '../core/api/graphql_client.dart' as _i854;
import '../core/api/injection_module.dart' as _i821;
import '../core/network/network_info.dart' as _i6;
import '../data/datasources/local/country_local_data_source.dart' as _i413;
import '../data/datasources/remote/character_remote_data_source.dart' as _i399;
import '../data/datasources/remote/item_remote_data_sources.dart' as _i808;
import '../data/datasources/remote/user_remote_data_sources.dart' as _i713;
import '../data/repositories/country_repository_impl.dart' as _i73;
import '../data/repositories/item_repository_impl.dart' as _i334;
import '../data/repositories/user_repository_impl.dart' as _i223;
import '../domain/repositories/character_repository.dart' as _i357;
import '../domain/repositories/country_repository.dart' as _i219;
import '../domain/repositories/item_repository.dart' as _i59;
import '../domain/repositories/user_repository.dart' as _i544;
import '../domain/usecases/get_character_usecase.dart' as _i678;
import '../presentation/cubit/country_cubit/country_cubit.dart' as _i291;
import '../presentation/cubit/item_cubit/item_cubit.dart' as _i482;
import '../presentation/cubit/user_cubit/user_cubit.dart' as _i807;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $initGetIt(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final injectionModule = _$InjectionModule();
  gh.lazySingleton<_i973.InternetConnectionChecker>(
      () => injectionModule.connectionChecker);
  gh.lazySingleton<_i895.Connectivity>(() => injectionModule.connectivity());
  gh.lazySingleton<_i128.GraphQLClient>(() => injectionModule.graphQLClient());
  gh.lazySingleton<_i6.NetworkInfo>(
      () => _i6.NetworkInfo(gh<_i895.Connectivity>()));
  gh.lazySingleton<_i413.CountryLocalDataSource>(
      () => _i413.CountryLocalDataSourceImpl());
  gh.lazySingleton<_i678.GetCharacterUsecase>(
      () => _i678.GetCharacterUsecase(gh<_i357.CharacterRepository>()));
  gh.lazySingleton<_i854.GraphqlClient>(
      () => _i854.GraphqlClient(gh<_i128.GraphQLClient>()));
  gh.lazySingleton<_i399.CharacterRemoteDataSource>(
      () => _i399.CharacterRemoteDataSourceImpl(gh<_i854.GraphqlClient>()));
  gh.lazySingleton<_i713.UserRemoteDataSource>(
      () => _i713.UserRemoteDataSourceImpl(gh<_i854.GraphqlClient>()));
  gh.lazySingleton<_i808.ItemRemoteDataSource>(
      () => _i808.ItemRemoteDataSourceImpl(gh<_i854.GraphqlClient>()));
  gh.lazySingleton<_i219.CountryRepository>(
      () => _i73.CountryRepositoryImpl(gh<_i808.ItemRemoteDataSource>()));
  gh.lazySingleton<_i544.UserRepository>(
      () => _i223.UserRepositoryImpl(gh<_i713.UserRemoteDataSource>()));
  gh.factory<_i291.CountryCubit>(
      () => _i291.CountryCubit(gh<_i219.CountryRepository>()));
  gh.lazySingleton<_i59.ItemRepository>(() => _i334.ItemRepositoryImpl(
        gh<_i808.ItemRemoteDataSource>(),
        gh<_i413.CountryLocalDataSource>(),
      ));
  gh.factory<_i807.UserCubit>(
      () => _i807.UserCubit(gh<_i544.UserRepository>()));
  gh.factory<_i482.ItemCubit>(() => _i482.ItemCubit(gh<_i59.ItemRepository>()));
  return getIt;
}

class _$InjectionModule extends _i821.InjectionModule {}
