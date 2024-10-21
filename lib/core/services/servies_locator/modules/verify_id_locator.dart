
import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/verify_id/data/repo/verify_id_repo.dart';

verifyIdLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<VerifyIdRepo>(() =>const  VerifyIdRepo());
}