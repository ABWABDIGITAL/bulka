import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/profile_change_password/data/repo/profile_change_password_repo.dart';

changePasswordLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<ProfileChangePasswordRepo>(() =>const  ProfileChangePasswordRepo());
}