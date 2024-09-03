import 'package:equatable/equatable.dart';

class InterestsEntity extends Equatable {
  const InterestsEntity({
    required this.image,
    required this.name,
    required this.id,
  });
  final int id;
  final String image;
  final String name;

  @override
  List<Object?> get props => [image, name, id];
}
