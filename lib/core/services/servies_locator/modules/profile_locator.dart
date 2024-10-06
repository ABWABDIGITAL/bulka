import 'package:bulka/core/services/profile_info/data/repo/my_profile_info_repo.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';

void profileLocator() {
//--------------------------------PROFILE--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<MyProfileInfoRepo>(() => const MyProfileInfoRepo());
}
