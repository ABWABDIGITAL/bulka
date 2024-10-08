import 'package:equatable/equatable.dart';

class PackagesEntity extends Equatable {
  const PackagesEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.durationPerDay,
    required this.numberOfStanderedAds,
    required this.numberOfPromotionAds,
  });

  final int id;
  final String name;
  final String price;
  final String image;
  final num durationPerDay;
  final num numberOfStanderedAds;
  final num numberOfPromotionAds;

  @override
  List<Object?> get props => [
        id,
        name,
        price,
        image,
        durationPerDay,
        numberOfStanderedAds,
        numberOfPromotionAds
      ];
}
