import 'package:bulka/modules/offers/data/entities/offers_banner_entity.dart';

class OffersBannerModel extends OffersBannerEntity {
  const OffersBannerModel({required super.image});

  factory OffersBannerModel.fromJson(Map<String, dynamic> json) {
    return OffersBannerModel(image: json['image']);
  }
}
