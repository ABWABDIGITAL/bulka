import 'package:bulka/modules/about_us/data/entities/terms_params.dart';

class TermsModel extends TermsEntity {
  const TermsModel(
      {required super.id, required super.title, required super.description});

  factory TermsModel.fromJson(Map<String, dynamic> json) {
    return TermsModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
    );
  }

}
