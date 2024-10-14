import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/certifications/data/repo/certification_repo.dart';

certificationLocator() {
  //REPOSITORIES
  sl.registerLazySingleton<CertificationRepo>(() => const CertificationRepo());
}
