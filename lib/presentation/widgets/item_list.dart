import 'package:flutter/material.dart';
import 'package:graphql_example/data/models/country.dart';


class ItemList extends StatelessWidget {
  final List<Country> items;

  const ItemList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return ListTile(
          title: Text(item.name),
          leading: Text(item.code),
        );
      },
    );
  }
}
