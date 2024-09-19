import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/countries/data/repo/country_repo.dart';

void countryLocator() {
//--------------------------------COUNTRY--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<CountryRepo>(() => const CountryRepo());
}
