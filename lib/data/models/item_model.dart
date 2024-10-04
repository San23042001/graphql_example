import 'package:graphql_example/domain/entities/item.dart';

class ItemModel extends Item {
  const ItemModel({required super.id, required super.name});

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(id: json['code'], name: json['name']);
  }

  Map<String, dynamic> toJson() {
    return {
      'code': id,
      'name': name,
    };
  }
}
