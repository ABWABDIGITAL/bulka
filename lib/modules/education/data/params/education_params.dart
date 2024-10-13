import 'package:equatable/equatable.dart';

class EducationParams extends Equatable {
  final int educationId;
  final int universityId;
  final String startDate;
  final String endDate;
  final int stillStudy;
  final String universityName;
  final String description;

  const EducationParams(
      {required this.educationId,
      required this.startDate,
      required this.universityName,
      required this.endDate,
      required this.stillStudy,
      required this.universityId,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'university_name': universityName,
      'education_degree_id': educationId,
      'start_date': startDate,
      'end_date': endDate,
      'still_study': stillStudy,
      'university_id': universityId,
      'description': description
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
