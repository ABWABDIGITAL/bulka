import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/packages/data/repo/packages_repo.dart';

void packagesLocator() {
//-----------------------------------PACKAGES------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<PackagesRepo>(() => const PackagesRepo());
}
