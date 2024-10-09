import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/modules/packages/data/entity/subscribe_entity.dart';
import 'package:bulka/modules/packages/data/model/package_model.dart';

class SubscribeModel extends SubscribeEntity {
  const SubscribeModel({
    required super.message,
    required super.subscribeId,
    required super.packages,
    required super.status,
    required super.expiresAt,
  });

  factory SubscribeModel.fromJson(Map<String, dynamic> json) {
    return SubscribeModel(
      message: json['message'],
      subscribeId: json['data']['id'],
      packages: PackageModel.fromJson(json['data']['package']),
      status: EnumSwitchReturn.getSubscribtionStatusType(
          json['data']['subscription_status']),
      expiresAt: json['data']['expires_at'],
    );
  }
}
