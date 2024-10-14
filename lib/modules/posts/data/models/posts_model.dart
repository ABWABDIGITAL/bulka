import 'package:bulka/core/services/ad_details/data/model/ad_details_model.dart';
import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/posts/data/entity/posts_entity.dart';
import 'package:bulka/modules/posts/data/models/post_details_model.dart';

// ignore: must_be_immutable
class PostsModel extends PostsEntity {
  PostsModel({
    required super.posts,
    required super.paggination,
  });

  factory PostsModel.fromJson(Map<String, dynamic> json) {
    return PostsModel(
      posts: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => PostDetailsModel.fromJson(e))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
