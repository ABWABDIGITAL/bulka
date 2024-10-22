import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/contact_info/data/repo/contact_info_repo.dart';

contactInfoLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<ContactInfoRepo>(() =>const  ContactInfoRepo());
}