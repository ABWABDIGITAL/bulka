import 'package:bulka/core/services/ad_details/data/repo/ad_details_repo.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';

void adDetailsLocator() {
//--------------------------------AD LOCATOR--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<AdDetailsRepo>(() => const AdDetailsRepo());
}
