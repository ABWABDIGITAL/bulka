import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class NotificationEntity extends Equatable {
  const NotificationEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.notificationTypes,
    required this.createdAt,
    required this.senderId,
    required this.senderFullName,
    required this.dataId,
    required this.userId,
    required this.adId,
    required this.readAt,
  });
  final String id;
  final int? senderId;
  final String? senderFullName;
  final String title;
  final String body;
  final int? dataId;
  final int? userId;
  final int? adId;
  final NotificationTypes notificationTypes;
  final String createdAt;
  final String? readAt;

  @override
  List<Object?> get props => [
        id,
        senderId,
        senderFullName,
        title,
        body,
        dataId,
        userId,
        adId,
        notificationTypes,
        createdAt,
        readAt
      ];
}
