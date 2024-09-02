import 'package:bulka/modules/home_templet/data/entity/banner_entity.dart';

class BannerModel extends BannerEntity {
  const BannerModel({
    required super.id,
    required super.name,
    required super.link,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'],
      name: json['name'] ?? json['title'],
      link: json['link'],
    );
  }
}
