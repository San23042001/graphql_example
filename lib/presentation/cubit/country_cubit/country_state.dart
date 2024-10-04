part of 'country_cubit.dart';

sealed class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

final class CountryInitial extends CountryState {}

class CountryLoadingState extends CountryState {
  @override
  List<Object> get props => [];
}

class CountryLoadedState extends CountryState {
  final List<Country> items;
  const CountryLoadedState(this.items);
  @override
  List<Object> get props => [items];
}

class CountryErrorState extends CountryState {
  final String error;

  const CountryErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
