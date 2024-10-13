import 'package:bulka/modules/education/data/entities/education_entity.dart';

class EducationModel extends EducationEntity {
  const EducationModel(
      {required super.educationTitleName,
      required super.startDate,
      required super.endDate,
      required super.stillWorking,
      required super.companyName,
      required super.description});

  factory EducationModel.fromJson(Map<String, dynamic> json) {
    return EducationModel(
        educationTitleName: json['education_title']['name']??'no education name',
        startDate: json['start_date']??'no start date',
        endDate: json['end_date']??'no end date',
        stillWorking: json['still_working']??'no still working',
        companyName: json['company_name']??'no company name',
        description: json['description']??'no description');
  }
}
