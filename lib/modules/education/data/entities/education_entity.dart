import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
  final int id;
  final String educationTitleName;
  final int educationId;
  final String startDate;
  final int universityId;
  final String endDate;
  final int stillStudy;
  final String universityName;
  final String description;

  const EducationEntity(
      {required this.educationTitleName,
      required this.educationId,
      required this.id,
      required this.startDate,
      required this.endDate,
      required this.stillStudy,
      required this.universityId,
      required this.universityName,
      required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
