import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/notifications/data/entity/all_notifications_entity.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';

sealed class NotificationsState {
  const NotificationsState();
}

final class NotificationInitial extends NotificationsState {
  const NotificationInitial();
}

final class GetAllNotificationsLoading extends NotificationsState {
  const GetAllNotificationsLoading();
}

final class GetAllNotificationsSuccess extends NotificationsState {
  final AllNotificationsEntity allNotifications;
  const GetAllNotificationsSuccess(this.allNotifications);
}

final class GetAllNotificationsError extends NotificationsState {
  final ApiErrorEntity error;
  const GetAllNotificationsError(this.error);
}

final class NotificationDetailsLoading extends NotificationsState {
  const NotificationDetailsLoading();
}

final class NotificationDetailsSuccess extends NotificationsState {
  final NotificationEntity notification;
  const NotificationDetailsSuccess(this.notification);
}

final class NotificationDetailsError extends NotificationsState {
  final ApiErrorEntity error;
  const NotificationDetailsError(this.error);
}
