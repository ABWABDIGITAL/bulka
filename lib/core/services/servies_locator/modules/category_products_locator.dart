import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/category_products/data/repo/category_products_repo.dart';

void categoryProductsLocator() {
//---------------------------------CATEGORY------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<CategoryProductsRepo>(
      () => const CategoryProductsRepo());
}
