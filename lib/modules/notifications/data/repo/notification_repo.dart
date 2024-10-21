import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/modules/notifications/data/entity/all_notifications_entity.dart';
import 'package:bulka/modules/notifications/data/entity/notification_entity.dart';
import 'package:bulka/modules/notifications/data/model/all_notifications_model.dart';
import 'package:bulka/modules/notifications/data/model/notification_model.dart';
import 'package:bulka/modules/notifications/data/params/all_notification_params.dart';
import 'package:bulka/modules/notifications/data/params/notification_details_params.dart';
import 'package:dartz/dartz.dart';

class NotificationsRepo {
  const NotificationsRepo();

  Future<Either<ApiErrorEntity, AllNotificationsEntity>> getNotifications(
      AllNotificationParams params) async {
    try {
      final response = await DioHelper.get(
        ApiConstance.allNotifications,
        queries: params.returnedMap(),
      );
      return Right(AllNotificationsModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }

  Future<Either<ApiErrorEntity, NotificationEntity>> notificationDetails(
      NotificationDetailsParams params) async {
    try {
      final response =
          await DioHelper.get(ApiConstance.notificationDetails(params));
      return Right(NotificationModel.fromJson(response.data['data']));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
