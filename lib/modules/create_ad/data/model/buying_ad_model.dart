import 'package:bulka/modules/create_ad/data/entity/buying_ad_entity.dart';

class BuyingAdModel extends BuyingAdEntity {
  const BuyingAdModel({
    required super.isSubscribed,
    required super.reminedNumberOfStandardAd,
    required super.reminedNumberOfPromotionAd,
    required super.freeAd,
    required super.priceOfPromotionAd,
    required super.priceOfStandardAd,
    required super.message,
  });

  factory BuyingAdModel.fromJson(Map<String, dynamic> json) {
    return BuyingAdModel(
      isSubscribed: json['data']['is_subscribed'],
      reminedNumberOfStandardAd: json['data']['subscription_ads']
          ['remained_number_of_standard_ads'],
      reminedNumberOfPromotionAd: json['data']['subscription_ads']
          ['remained_number_of_promotion_ads'],
      freeAd: json['data']['free_ads'],
      priceOfPromotionAd: json['data']['price_of_promotion_ad'],
      priceOfStandardAd: json['data']['price_of_standard_ad'],
      message: json['message'],
    );
  }
}
