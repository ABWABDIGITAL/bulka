import 'package:bulka/core/services/categories/data/repo/category_repo.dart';
import 'package:bulka/core/services/servies_locator/service_locator.dart';

void categoryLocator() {
//---------------------------------CATEGORY------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<CategoryRepo>(() => const CategoryRepo());
}
