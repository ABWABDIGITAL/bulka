import 'package:bulka/modules/about_us/data/entities/about_us_entity.dart';

class AboutUsModel extends AboutUsEntity {
  const AboutUsModel({required super.name, required super.link});

  factory AboutUsModel.fromJson(Map<String, dynamic> json) {
    return AboutUsModel(
      name: json['name'],
      link: json['link'],
    );
  }
}
