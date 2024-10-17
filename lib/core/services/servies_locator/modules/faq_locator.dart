import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/faq/data/repo/faq_repo.dart';

faqLocator(){
  //REPOSITORIES
  sl.registerLazySingleton<FaqRepo>(() =>const  FaqRepo());
}