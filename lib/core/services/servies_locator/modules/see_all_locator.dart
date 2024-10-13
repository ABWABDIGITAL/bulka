import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/see_all_ad/data/repo/see_all_repo.dart';

void seeAllLocator() {
//--------------------------------PROFILE--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SeeAllAdRepo>(() => const SeeAllAdRepo());
}
