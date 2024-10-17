import 'package:equatable/equatable.dart';

class SkillsParams extends Equatable {
  final List<int> skillsIds;
  final int skillId;
  final String? skillName;

  const SkillsParams(this.skillsIds, {required this.skillId, this.skillName});

  Map<String, dynamic> toMap() {
    List<int> chosenSkillsIds = [];
    for (var element in skillsIds) {
      chosenSkillsIds.add(element);
    }

    return {
      'skill_ids': skillsIds,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
