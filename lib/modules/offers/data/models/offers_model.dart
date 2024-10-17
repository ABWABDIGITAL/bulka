import 'package:bulka/modules/offers/data/entities/offers_entity.dart';

class OffersModel extends OffersEntity {
  const OffersModel(
      {required super.title,
      required super.description,
      required super.image,
      required super.startDate,
      required super.endDate,
      required super.amount,
      required super.code});

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(
        title: json['title'] ?? 'no title',
        description: json['description'] ?? 'no description',
        image: json['image'],
        startDate: json['start_time'] ?? 'no start time',
        endDate: json['end_time'],
        amount: json['amount'],
        code: json['code']);
  }
}
