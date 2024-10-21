import 'package:bloc/bloc.dart';
import 'package:bulka/modules/notifications/controller/cubit/notification_state.dart';
import 'package:bulka/modules/notifications/data/entity/all_notifications_entity.dart';
import 'package:bulka/modules/notifications/data/params/all_notification_params.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:bulka/modules/notifications/data/repo/notification_repo.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  final NotificationsRepo _notificationsRepo;
  NotificationsCubit(this._notificationsRepo)
      : super(const NotificationInitial());
//---------------------------------VARIABLES----------------------------------//
  AllNotificationsEntity? _allNotificationsEntity;
  int page = 1;

//---------------------------------FUNCTIONS----------------------------------//
  AllNotificationsEntity? get allNotificationsEntity => _allNotificationsEntity;
//----------------------------------REQUEST-----------------------------------//
  Future<void> notificationsStatesHandled() async {
    emit(const GetAllNotificationsLoading());
    final response = await _notificationsRepo
        .getNotifications(AllNotificationParams(page: page));
    response.fold((failure) {
      return emit(GetAllNotificationsError(failure));
    }, (success) async {
      if (_allNotificationsEntity == null || page == 1) {
        _allNotificationsEntity = success;
      } else {
        _allNotificationsEntity!.paggination = success.paggination;
        if (success.notifications.isNotEmpty) {
          success.notifications
              .map((e) => _allNotificationsEntity!.notifications.add(e))
              .toList();
        }
      }
      return emit(GetAllNotificationsSuccess(success));
    });
  }

  Future<void> notificationDetailsStatesHandled(
      NotificationDetailsParams params) async {
    emit(const NotificationDetailsLoading());
    final response = await _notificationsRepo.notificationDetails(params);
    response.fold((failure) {
      return emit(NotificationDetailsError(failure));
    }, (success) async {
      return emit(NotificationDetailsSuccess(success));
    });
  }
}
