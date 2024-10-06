import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/home/data/repo/home_repo.dart';

void homeLocator() {
//--------------------------------HOME--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<HomeRepo>(() => const HomeRepo());
}
