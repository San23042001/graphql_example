import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_example/data/models/country.dart';

import 'package:graphql_example/presentation/cubit/country_cubit/country_cubit.dart';
import 'package:graphql_example/presentation/cubit/item_cubit/item_cubit.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries'),
      ),
      body: BlocBuilder<ItemCubit, ItemState>(
        builder: (context, state) {
          if (state is ItemLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ItemLoadedState) {
            return _buildItemList(state.items);
          } else if (state is ItemErrorState) {
            return const Text("Oops Something Went Wrong");
          } else {
            return const Center(child: Text('Unexpected State'));
          }
        },
      ),
    );
  }

  Widget _buildItemList(List<Country> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.name),
          subtitle: Text(item.code),
        );
      },
    );
  }

  Widget _buildErrorUI(String error, BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            error,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, color: Colors.red),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Retry fetching data
              context.read<CountryCubit>().getItems();
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
