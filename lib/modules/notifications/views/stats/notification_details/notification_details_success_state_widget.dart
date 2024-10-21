import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';
import 'package:flutter/material.dart';

class NotificationDetailsSuccessStateWidget extends StatelessWidget {
  const NotificationDetailsSuccessStateWidget(this.notification, {super.key});
  final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          notification.title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Text(
          'From: ${notification.senderFullName ?? "Unknown"}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        Text(
          'Sent: ${DateFormats.formatDateYearMonthDayHoursMinAmOrPm(notification.createdAt)}',
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        const SizedBox(height: 16),
        const Divider(),
        const SizedBox(height: 16),
        Text(
          notification.body,
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 16),
        notification.readAt != null
            ? Text(
                'Read at: ${DateFormats.formatDateYearMonthDayHoursMinAmOrPm(notification.readAt!)}',
                style: const TextStyle(fontSize: 14, color: Colors.green),
              )
            : const Text(
                'Unread',
                style: TextStyle(fontSize: 14, color: Colors.red),
              ),
      ],
    );
  }
}
