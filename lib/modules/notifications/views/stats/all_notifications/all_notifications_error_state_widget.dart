import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/core/utils/widgets/errors/error_screen.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNotificationsErrorStateWidget extends StatelessWidget {
  const AllNotificationsErrorStateWidget(this.error, {super.key});
  final ApiErrorEntity error;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NotificationsCubit>();

    return cubit.allNotificationsEntity == null
        ? ErrorFullScreen(
            error: error,
            onPressed: () {
              cubit.notificationsStatesHandled();
            },
          )
        : ErrorScreen(
            error: error,
            onPressed: () {
              cubit.notificationsStatesHandled();
            },
          );
  }
}
