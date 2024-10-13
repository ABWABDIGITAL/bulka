import 'package:equatable/equatable.dart';

class EducationEntity extends Equatable {
  final String educationTitleName;
  final String startDate;
  final String endDate;
  final String stillWorking;
  final String companyName;
  final String description;

  const EducationEntity(
      {required this.educationTitleName,
      required this.startDate,
      required this.endDate,
      required this.stillWorking,
      required this.companyName,
      required this.description});
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
