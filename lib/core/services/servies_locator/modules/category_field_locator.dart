import 'package:bulka/core/services/category_fields/data/repo/category_field_repo.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';

void categoryFieldLocator() {
//---------------------------------CATEGORY------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<CategoryFieldRepo>(() => const CategoryFieldRepo());
}
