// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bulka/modules/skills/data/entities/skills_entity.dart';
import 'package:equatable/equatable.dart';

class SkillsParams extends Equatable {
  final List<SkillsEntity> skillsIds;

  const SkillsParams({
    required this.skillsIds,
  });

  Map<String, dynamic> toMap() {
    List<int> chosenSkillsIds = [];
    for (var element in skillsIds) {
      chosenSkillsIds.add(element.skillId);
    }

    return {
      'skill_ids': chosenSkillsIds,
    };
  }

  @override
  List<Object> get props => [skillsIds];
}
