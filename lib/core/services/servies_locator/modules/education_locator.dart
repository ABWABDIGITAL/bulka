import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/education/data/repo/education_repo.dart';

educationLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<EducationRepo>(() =>const  EducationRepo());
}