import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/search/data/repo/search_repo.dart';

void searchLocator() {
//--------------------------------SEARCH--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SearchRepo>(() => const SearchRepo());
}
