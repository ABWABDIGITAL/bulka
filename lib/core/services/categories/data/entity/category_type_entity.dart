import 'package:equatable/equatable.dart';

class CategoryTypeEntity extends Equatable {
  const CategoryTypeEntity({
    required this.name,
    required this.key,
    required this.icon,
    required this.id,
  });
  final String name;
  final String key;
  final String icon;
  final int id;

  @override
  List<Object?> get props => [name, key, icon, id];
}
