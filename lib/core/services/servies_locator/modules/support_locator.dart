
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/support/data/repo/support_repo.dart';

supportLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<SupportRepo>(() =>const  SupportRepo());
}