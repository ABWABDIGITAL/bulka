
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/cv/data/repo/cv_repo.dart';

cvLocator() {
  //REPOSITORIES
  sl.registerLazySingleton<CvRepo>(() => const CvRepo());
}
