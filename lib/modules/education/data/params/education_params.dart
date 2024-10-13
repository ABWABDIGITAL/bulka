import 'package:equatable/equatable.dart';

class EducationParams extends Equatable {
  final int educationId;
  final String startDate;
  final String endDate;
  final String stillWorking;
  final String companyName;
  final String description;

  const EducationParams(
      {required this.educationId,
      required this.startDate,
      required this.endDate,
      required this.stillWorking,
      required this.companyName,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'educaiton_id':educationId,
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
