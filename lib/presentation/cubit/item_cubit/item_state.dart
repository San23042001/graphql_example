part of 'item_cubit.dart';

sealed class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

final class ItemInitial extends ItemState {}

class ItemLoadingState extends ItemState {
  @override
  List<Object> get props => [];
}

class ItemLoadedState extends ItemState {
  final List<Country> items;
  const ItemLoadedState(this.items);
  @override
  List<Object> get props => [items];
}

class ItemErrorState extends ItemState {
  final AppError error;

  const ItemErrorState({required this.error});
  @override
  List<Object> get props => [error];
}
