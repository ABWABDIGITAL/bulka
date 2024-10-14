import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/education/data/entities/education_entity.dart';

class EducationModel extends EducationEntity {
  const EducationModel(
      {required super.educationTitleName,
      required super.startDate,
      required super.educationId
      ,
      required super.universityId,
      required super.id,
      required super.endDate,
      required super.stillStudy,
      required super.universityName,
      required super.description});

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
      educationId:checkFromMap(json['education_degree'])? json['education_degree']['id']:0,
        id: json['id']??0,
      universityId: json['university']['id']??0 ,
        educationTitleName:
         checkFromMap(json['education_degree'])?   json['education_degree']['name'] :'no education name',
        startDate: json['start_date'] ?? 'no start date',
        endDate: json['end_date'] ?? 'no end date',
        stillStudy: json['still_study'] ?? 'no still study',
        universityName:checkFromMap(json['university'])? json['university']['name'] : 'no university name',
        description: json['description'] ?? 'no description');
  }
}
