import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/chats/all_chats/data/repo/all_chat_repo.dart';
import 'package:bulka/modules/chats/specific_chat/data/repo/specific_chat_repo.dart';

void chatLocator() {
//----------------------------------ALL CHAT----------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<AllChatRepo>(() => const AllChatRepo());

//--------------------------------SPECIFIC CHAT--------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<SpecificChatRepo>(() => const SpecificChatRepo());
}
