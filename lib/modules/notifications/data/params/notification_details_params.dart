import 'package:equatable/equatable.dart';

class NotificationDetailsParams extends Equatable {
  const NotificationDetailsParams({required this.notificationId});

  final String notificationId;

  @override
  List<Object?> get props => [notificationId];
}
