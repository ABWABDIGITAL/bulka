import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/about_us/data/repo/about_us_repo.dart';

aboutUsLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<AboutUsRepo>(() =>const  AboutUsRepo());
}