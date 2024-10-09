
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/edit_profile/data/repo/edit_profile_repo.dart';

editProfileLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<EditProfileRepo>(() =>const  EditProfileRepo());
}