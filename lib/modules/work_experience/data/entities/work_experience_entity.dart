import 'package:equatable/equatable.dart';

class WorkExperienceEntity extends Equatable {
  final int id;
  final String jobTitleName;
  final int jobTitleId;
  final String startDate;
  final String endDate;
  final int stillWorking;
  final String companyName;
  final String description;

  const WorkExperienceEntity(
      {required this.jobTitleName,
      required this.id,
      required this.jobTitleId,
      required this.startDate,
      required this.endDate,
      required this.stillWorking,
      required this.companyName,
      required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
