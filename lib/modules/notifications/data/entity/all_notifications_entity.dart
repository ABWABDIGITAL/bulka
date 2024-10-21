import 'package:bulka/core/shared/entity/paggination_entity.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class AllNotificationsEntity extends Equatable {
  AllNotificationsEntity({
    required this.notifications,
    required this.paggination,
  });
  List<NotificationEntity> notifications;
  PagginationEntity paggination;

  @override
  List<Object?> get props => [notifications, paggination];
}
