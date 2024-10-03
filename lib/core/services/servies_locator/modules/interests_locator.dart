import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/choose_interests/data/repo/interests_repo.dart';

void interestsLocator() {
//-----------------------------------NAVBAR------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<InterestsRepo>(() => const InterestsRepo());
}
