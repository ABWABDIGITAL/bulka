import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/skills/data/repo/skills_repo.dart';

skillsLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<SkillsRepo>(() =>const  SkillsRepo());
}