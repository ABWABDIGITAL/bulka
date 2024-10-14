import 'package:bulka/modules/work_experience/data/entities/job_titles_entity.dart';

class JobTitleModel extends JobTitlesEntity {
  const JobTitleModel({required super.id, required super.name});

  factory JobTitleModel.fromJson(Map<String, dynamic> json) {
    return JobTitleModel(
      id: json['id']??'no id',
      name: json['name']??'no name',
    );
  }
}
