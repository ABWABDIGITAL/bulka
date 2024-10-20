import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/extensions/extensions.dart';
import 'package:bulka/core/utils/widgets/format_date/date_format.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:bulka/modules/notifications/views/screens/notification_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationCardWidget extends StatelessWidget {
  final NotificationEntity notification;
  const NotificationCardWidget({super.key, required this.notification});

  Icon _getIcon(NotificationTypes type) {
    switch (type) {
      case NotificationTypes.approved_ad_by_admin:
        return const Icon(Icons.message, color: Colors.blue);
      case NotificationTypes.none:
        return const Icon(Icons.abc, color: Colors.blue);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          elevation: notification.readAt == null ? .1 : 0,
          color: notification.readAt == null ? Colors.grey[200] : Colors.white,
          child: ListTile(
            leading: CircleAvatar(
              child: _getIcon(notification.notificationTypes),
            ),
            title: Text(
              notification.title,
              style: TextStyle(
                fontWeight: notification.readAt == null
                    ? FontWeight.bold
                    : FontWeight.normal,
              ),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(notification.body),
                const SizedBox(height: 5),
                Text(
                  'From: ${notification.senderFullName ?? "Unknown"}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'Sent: ${DateFormats.formatDateYearMonthDayHoursMinAmOrPm(notification.createdAt)}', // You can format this date as you prefer
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            trailing: notification.readAt == null
                ? const Icon(Icons.circle, color: Colors.red, size: 12)
                : const Icon(Icons.check_circle, color: Colors.green, size: 12),
            onTap: () {
              context.push(
                NotificationDetailsScreen(
                  cubit: context.read<NotificationsCubit>(),
                  params: NotificationDetailsParams(
                      notificationId: notification.id),
                ),
              );
            },
          ),
        ),
        Divider(
          endIndent: 20,
          indent: 20,
          color: Colors.grey[300],
          thickness: .5,
        ),
      ],
    );
  }
}
