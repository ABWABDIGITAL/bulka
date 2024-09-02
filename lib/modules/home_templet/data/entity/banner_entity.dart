import 'package:equatable/equatable.dart';

class BannerEntity extends Equatable {
  const BannerEntity(
      {required this.id, required this.name, required this.link});

  final String id;
  final String name;
  final String link;

  @override
  List<Object?> get props => [id, name, link];
}
