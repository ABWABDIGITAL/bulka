import 'package:equatable/equatable.dart';

class OffersEntity extends Equatable {
  final String title;
  final String description;
  final String image;
  final String startDate;
  final String endDate;
  final String amount;
  final String code;

  const OffersEntity(
      {required this.title,
      required this.description,
      required this.image,
      required this.startDate,
      required this.endDate,
      required this.amount,
      required this.code});

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'start_time': startDate,
      'end_time': endDate,
      'amount': amount,
      'code': code,
    };
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
