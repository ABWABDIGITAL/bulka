import 'package:bulka/modules/packages/data/entity/pay_subscribtion_entity.dart';

class PaySubscribtionModel extends PaySubscribtionEntity {
  const PaySubscribtionModel({required super.message});

  factory PaySubscribtionModel.fromJson(Map<String, dynamic> json) {
    return PaySubscribtionModel(message: json['message']);
  }
}
