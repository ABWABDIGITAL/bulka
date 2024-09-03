import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/home_templet/data/repo/home_repo.dart';

void navbarLocator() {
//-----------------------------------NAVBAR------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<HomeRepo>(() => const HomeRepo());
}
