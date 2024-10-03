import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/settings/data/repo/settings_repo.dart';

void settingsLocator() {
//--------------------------------SETTINGS--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SettingsRepo>(() => const SettingsRepo());
}
