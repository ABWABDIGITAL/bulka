import 'package:bulka/modules/work_experience/data/entities/work_experience_entity.dart';

class WorkExperienceModel extends WorkExperienceEntity {
  const WorkExperienceModel(
      {required super.jobTitleName,
      required super.id,
      required super.startDate,
      required super.endDate,
      required super.stillWorking,
      required super.companyName,
      required super.description, required super.jobTitleId});

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) {
    return WorkExperienceModel(
        id: json['id'],
        jobTitleName: json['job_title']['name']??'no job name',
        jobTitleId: json['job_title']['id']??'no job id',
        startDate: json['start_date']??'no start date',
        endDate: json['end_date']??'no end date',
        stillWorking: json['still_working']??'no still working',
        companyName: json['company_name']??'no company name',
        description: json['description']??'no description');
  }
}
