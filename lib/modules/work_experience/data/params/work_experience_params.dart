import 'package:equatable/equatable.dart';

class WorkExperienceParams extends Equatable {
  final int jobTitleId;
  final String startDate;
  final String endDate;
  final String stillWorking;
  final String companyName;
  final String description;

  const WorkExperienceParams(
      {required this.jobTitleId,
      required this.startDate,
      required this.endDate,
      required this.stillWorking,
      required this.companyName,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'job_title_id':jobTitleId,
      'start_date':startDate,
      'end_date':endDate,
      'still_working':stillWorking,
      'company_name':companyName,
      'description':description
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
