import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_state.dart';
import 'package:bulka/modules/notifications/data/entity/all_notifications_entity.dart';
import 'package:bulka/modules/notifications/views/widgets/notification_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNotificationsSuccessStateWidget extends StatelessWidget {
  const AllNotificationsSuccessStateWidget(this.notifications, {super.key});
  final AllNotificationsEntity notifications;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      buildWhen: (previous, current) =>
          current is GetAllNotificationsLoading ||
          current is GetAllNotificationsSuccess ||
          current is GetAllNotificationsError,
      builder: (context, state) {
        return ListView.builder(
          itemCount: notifications.notifications.length,
          itemBuilder: (context, index) {
            return NotificationCardWidget(
              notification: notifications.notifications[index],
            );
          },
        );
      },
    );
  }
}
