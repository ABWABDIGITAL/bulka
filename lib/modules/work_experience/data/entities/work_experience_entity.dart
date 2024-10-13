import 'package:equatable/equatable.dart';

class WorkExperienceEntity extends Equatable {
  final String jobTitleName;
  final String startDate;
  final String endDate;
  final String stillWorking;
  final String companyName;
  final String description;

  const WorkExperienceEntity(
      {required this.jobTitleName,
      required this.startDate,
      required this.endDate,
      required this.stillWorking,
      required this.companyName,
      required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
