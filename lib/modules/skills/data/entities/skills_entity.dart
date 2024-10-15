import 'package:equatable/equatable.dart';

class SkillsEntity extends Equatable {
  final int skillId;
  final int id;
  final String name;

  const SkillsEntity({required this.id,required this.skillId, required this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
