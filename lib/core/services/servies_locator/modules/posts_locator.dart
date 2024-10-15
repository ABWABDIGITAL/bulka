import 'package:bulka/core/services/servies_locator/service_locator.dart';
import 'package:bulka/modules/posts/data/repo/posts_repo.dart';
import 'package:bulka/modules/posts_comments/data/repo/post_comments_repo.dart';

void postsLocator() {
//-----------------------------------POSTS------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<PostsRepo>(() => const PostsRepo());
//-----------------------------------COMMENTS------------------------------------//
  // REPOSITORIES
  sl.registerLazySingleton<PostCommentsRepo>(() => const PostCommentsRepo());
}
