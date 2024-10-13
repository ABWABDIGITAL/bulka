import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/work_experience/data/repo/work_experience_repo.dart';

workExperienceLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<WorkExperienceRepo>(() =>const  WorkExperienceRepo());
}