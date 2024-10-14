import 'package:equatable/equatable.dart';

class CertificationParams extends Equatable {
  final String endDate;

  final String name;
  final String link;
  final String description;

  const CertificationParams(
      {required this.endDate,
      required this.link,
      required this.name,
      required this.description});

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'end_date': endDate,
      'name': name,
      'description': description
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
