import 'package:equatable/equatable.dart';

class Item extends Equatable {
  final String id;
  final String name;

  const Item({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
