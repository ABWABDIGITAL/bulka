import 'package:bulka/modules/packages/data/entity/packages_entity.dart';

class PackageModel extends PackagesEntity {
  const PackageModel({
    required super.id,
    required super.name,
    required super.price,
    required super.image,
    required super.durationPerDay,
    required super.numberOfStanderedAds,
    required super.numberOfPromotionAds,
  });

  factory PackageModel.fromJson(Map<String, dynamic> json) {
    return PackageModel(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      image: json['image'],
      durationPerDay: json['duration_per_day'],
      numberOfStanderedAds: json['number_of_standard_ads'],
      numberOfPromotionAds: json['number_of_promotion_ads'],
    );
  }
}
