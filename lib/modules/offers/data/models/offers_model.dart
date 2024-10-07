import 'package:bulka/modules/offers/data/entities/offers_entity.dart';

class OffersModel extends OffersEntity {
  const OffersModel({required super.offersSlider});

  factory OffersModel.fromJson(Map<String, dynamic> json) {
    return OffersModel(offersSlider: json['offersSlider']);
  }
}
