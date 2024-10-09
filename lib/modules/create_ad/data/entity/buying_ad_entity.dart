import 'package:equatable/equatable.dart';

class BuyingAdEntity extends Equatable {
  const BuyingAdEntity({
    required this.isSubscribed,
    required this.reminedNumberOfStandardAd,
    required this.reminedNumberOfPromotionAd,
    required this.freeAd,
    required this.priceOfPromotionAd,
    required this.priceOfStandardAd,
    required this.message,
  });
  final bool isSubscribed;
  final num reminedNumberOfStandardAd;
  final num reminedNumberOfPromotionAd;
  final num freeAd;
  final num priceOfPromotionAd;
  final num priceOfStandardAd;
  final String message;

  @override
  List<Object?> get props => [
        isSubscribed,
        reminedNumberOfStandardAd,
        reminedNumberOfPromotionAd,
        freeAd,
        priceOfPromotionAd,
        priceOfStandardAd,
        message
      ];
}
