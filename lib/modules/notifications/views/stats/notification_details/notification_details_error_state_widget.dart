import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/widgets/errors/error_full_screen.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDetailsErrorStateWidget extends StatelessWidget {
  const NotificationDetailsErrorStateWidget({
    super.key,
    required this.error,
    required this.params,
  });
  final ApiErrorEntity error;
  final NotificationDetailsParams params;
  @override
  Widget build(BuildContext context) {
    return ErrorFullScreen(
      onPressed: () {
        context
            .read<NotificationsCubit>()
            .notificationDetailsStatesHandled(params);
      },
      error: error,
    );
  }
}
