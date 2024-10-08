import 'package:bulka/core/services/ad_details/data/entity/ad_details_entity.dart';

class AdDetailsModel extends AdDetailsEntity {
  const AdDetailsModel({required super.id});

  factory AdDetailsModel.fromJson(Map<String, dynamic> json) {
    return AdDetailsModel(id: json['id']);
  }
}
