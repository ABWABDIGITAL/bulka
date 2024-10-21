import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_state.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:bulka/modules/notifications/views/stats/notification_details/notification_details_error_state_widget.dart';
import 'package:bulka/modules/notifications/views/stats/notification_details/notification_details_loading_state_widget.dart';
import 'package:bulka/modules/notifications/views/stats/notification_details/notification_details_success_state_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationDetailsScreen extends StatelessWidget {
  const NotificationDetailsScreen({
    super.key,
    required this.cubit,
    required this.params,
  });
  final NotificationsCubit cubit;
  final NotificationDetailsParams params;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: cubit..notificationDetailsStatesHandled(params),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: AppStrings.notifications.tr()),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocConsumer<NotificationsCubit, NotificationsState>(
            listener: (context, state) {
              if (state is NotificationDetailsSuccess) {
                cubit.notificationsStatesHandled();
              }
            },
            listenWhen: (previous, current) =>
                current is NotificationDetailsLoading ||
                current is NotificationDetailsSuccess ||
                current is NotificationDetailsError,
            buildWhen: (previous, current) =>
                current is NotificationDetailsLoading ||
                current is NotificationDetailsSuccess ||
                current is NotificationDetailsError,
            builder: (context, state) {
              if (state is NotificationDetailsLoading) {
                return const NotificationDetailsLoadingStateWidget();
              }
              if (state is NotificationDetailsError) {
                return NotificationDetailsErrorStateWidget(
                  error: state.error,
                  params: params,
                );
              }
              if (state is NotificationDetailsSuccess) {
                return NotificationDetailsSuccessStateWidget(
                    state.notification);
              }
              return const Text('no state provided');
            },
          ),
        ),
      ),
    );
  }
}
