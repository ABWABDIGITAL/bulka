import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/offers/data/repo/offers_repo.dart';

offersLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<OffersRepo>(() =>const  OffersRepo());
}