
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/user_language/data/repo/user_language_repo.dart';

userLanguageLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<UserLanguageRepo>(() =>const  UserLanguageRepo());
}