import 'package:bulka/modules/education/data/entities/education_university_entity.dart';

class EducationUniversityModel extends EducationUniversityEntity {
  const EducationUniversityModel({required super.name, required super.id});

  factory EducationUniversityModel.fromJson(Map<String, dynamic> json) {
    return EducationUniversityModel(
      name: json['name'],
      id: json['id'],
    );
  }
}
