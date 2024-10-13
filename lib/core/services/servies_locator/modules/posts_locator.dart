import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/posts/data/repo/posts_repo.dart';

void postsLocator() {
//-----------------------------------PACKAGES------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<PostsRepo>(() => const PostsRepo());
}
