import 'package:bulka/modules/create_ad/data/entity/create_ad_entity.dart';

class CreateAdModel extends CreateAdEntity {
  const CreateAdModel({required super.message});

  factory CreateAdModel.fromJson(Map<String, dynamic> json) {
    return CreateAdModel(
      message: json['message'] ?? "dummy",
    );
  }
}
