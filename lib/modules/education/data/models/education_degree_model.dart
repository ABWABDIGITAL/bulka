import 'package:bulka/modules/education/data/entities/education_degree_entity.dart';

class EducationDegreeModel extends EducationDegreeEntity {
  const EducationDegreeModel({required super.id, required super.name});

  factory EducationDegreeModel.fromJson(Map<String, dynamic> json) {
    return EducationDegreeModel(
      id: json['id'] ?? 'no id',
      name: json['name'] ?? 'no name',
    );
  }
}
