import 'package:bulka/modules/choose_interests/data/entity/send_interests_entity.dart';

class SendInterestsModel extends SendInterestsEntity {
  const SendInterestsModel({required super.message});

  factory SendInterestsModel.fromJson(Map<String, dynamic> json) {
    return SendInterestsModel(
      message: json['message'] ?? 'successfully Become Explorer ! 😀',
    );
  }
}
