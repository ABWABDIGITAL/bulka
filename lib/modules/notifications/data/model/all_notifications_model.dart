import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/notifications/data/entity/all_notifications_entity.dart';
import 'package:bulka/modules/notifications/data/model/notification_model.dart';

// ignore: must_be_immutable
class AllNotificationsModel extends AllNotificationsEntity {
  AllNotificationsModel({
    required super.notifications,
    required super.paggination,
  });

  factory AllNotificationsModel.fromJson(Map<String, dynamic> json) {
    return AllNotificationsModel(
      notifications: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => NotificationModel.fromJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
