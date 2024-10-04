import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/domain/entities/queries.dart';
import 'package:graphql_example/domain/repositories/country_repository.dart';

import 'package:injectable/injectable.dart';

part 'country_state.dart';

@injectable
class CountryCubit extends Cubit<CountryState> {
  final CountryRepository _countryRepository;
  CountryCubit(this._countryRepository) : super(CountryInitial());

  void getItems() async {
    emit(CountryLoadingState());
    final res = await _countryRepository.getCountry(Queries.getCountries, {});
    res.fold((error) => emit(CountryErrorState(error: error)),
        (items) => emit(CountryLoadedState(items)));
  }
}
