import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/services/subcategory/data/repo/subcategory_repo.dart';

void subcategoryLocator() {
//---------------------------------CATEGORY------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SubcategoryRepo>(() => const SubcategoryRepo());
}
