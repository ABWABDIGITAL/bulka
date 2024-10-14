import 'package:bulka/modules/favourites/data/entity/toggle_favourite_entity.dart';

class ToggleFavouriteModel extends ToggleFavouriteEntity {
  const ToggleFavouriteModel({required super.message});

  factory ToggleFavouriteModel.fromJson(Map<String, dynamic> json) {
    return ToggleFavouriteModel(message: json['message']);
  }
}
