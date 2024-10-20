import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/shared/widgets/appbar_widget.dart';
import 'package:bulka/core/utils/constant/app_strings.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_cubit.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_state.dart';
import 'package:bulka/modules/notifications/views/stats/all_notifications/all_notifications_loading_state_widget.dart';
import 'package:bulka/modules/notifications/views/stats/all_notifications/all_notifications_success_state_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          NotificationsCubit(sl())..notificationsStatesHandled(),
      child: Scaffold(
        appBar: CustomAppBarWidget(title: AppStrings.notifications.tr()),
        body: BlocBuilder<NotificationsCubit, NotificationsState>(
          buildWhen: (previous, current) =>
              current is GetAllNotificationsLoading ||
              current is GetAllNotificationsSuccess ||
              current is GetAllNotificationsError,
          builder: (context, state) {
            final cubit = context.read<NotificationsCubit>();
            if (state is GetAllNotificationsLoading) {
              return const AllNotificationsLoadingStateWidget();
            }
            if (state is GetAllNotificationsError) {
              return Center(child: Text(state.error.message));
            }
            if (cubit.allNotificationsEntity != null ||
                state is GetAllNotificationsSuccess) {
              return AllNotificationsSuccessStateWidget(
                  cubit.allNotificationsEntity!);
            }
            return const Text('no state provided');
          },
        ),
      ),
    );
  }
}
