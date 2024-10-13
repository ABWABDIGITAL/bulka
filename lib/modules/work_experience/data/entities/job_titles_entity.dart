import 'package:equatable/equatable.dart';

class JobTitlesEntity extends Equatable {
  final int id;
  final String name;

  const JobTitlesEntity({required this.id, required this.name});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
