import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/core/services/sub_subcategory/data/repo/sub_subcategory_repo.dart';

void subSubcategoryLocator() {
//---------------------------------CATEGORY------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SubSubcategoryRepo>(
      () => const SubSubcategoryRepo());
}
