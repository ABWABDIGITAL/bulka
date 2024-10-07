import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/logout/data/repo/logout_repo.dart';

logoutLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<LogoutRepo>(() => const LogoutRepo());
}