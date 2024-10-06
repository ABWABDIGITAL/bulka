import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/create_ad/data/repo/create_ad_repo.dart';

void createAdLocator() {
//--------------------------------CREATE AD--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<CreateAdRepo>(() => const CreateAdRepo());
}
