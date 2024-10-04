import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/domain/entities/app_error.dart';

import 'package:graphql_example/domain/entities/queries.dart';
import 'package:graphql_example/domain/repositories/item_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

part 'item_state.dart';

@injectable
class ItemCubit extends Cubit<ItemState> {
  final ItemRepository _itemRepository;
  ItemCubit(this._itemRepository) : super(ItemInitial());

  void getItems() async {
    emit(ItemLoadingState());
    final hasConnected = await InternetConnectionChecker().hasConnection;
    final res = await _itemRepository.getItems(Queries.getCountries, {});
    res.fold((error) => emit(ItemErrorState(error: error)), (items) async {
      if (hasConnected) {
        await _itemRepository.saveLocally(items);
        final country = await _itemRepository.fetchLocally();
        emit(ItemLoadedState(country!));
      }
    });
  }
}
