import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/notifications/data/repo/notification_repo.dart';

void notificationsLocator() {
//-----------------------------------NAVBAR------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<NotificationsRepo>(() => const NotificationsRepo());
}
