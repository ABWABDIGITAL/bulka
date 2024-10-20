import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';

class NotificationModel extends NotificationEntity {
  const NotificationModel({
    required super.id,
    required super.title,
    required super.body,
    required super.notificationTypes,
    required super.createdAt,
    required super.senderId,
    required super.senderFullName,
    required super.dataId,
    required super.userId,
    required super.adId,
    required super.readAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      title: getSuitableNameLanguageForScreen(json['title']),
      body: getSuitableNameLanguageForScreen(json['body']),
      notificationTypes:
          EnumSwitchReturn.getNotificationType(json['notification_type']),
      createdAt: json['created_at'],
      senderId: checkFromMap(json['sender']) ? json['sender']['id'] : null,
      senderFullName:
          checkFromMap(json['sender']) ? json['sender']['full_name'] : null,
      dataId: json['data_id'],
      userId: json['user_id'],
      adId: json['ad_id'],
      readAt: json['read_at'],
    );
  }
}
