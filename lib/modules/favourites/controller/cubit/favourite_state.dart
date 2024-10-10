import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/favourites/data/entity/toggle_favourite_entity.dart';

sealed class FavouriteState {
  const FavouriteState();
}

final class FavouriteInitial extends FavouriteState {}

final class ToggleFavouriteLoading extends FavouriteState {
  const ToggleFavouriteLoading();
}

final class ToggleFavouriteSuccess extends FavouriteState {
  final ToggleFavouriteEntity toggleFavouriteEntity;
  const ToggleFavouriteSuccess(this.toggleFavouriteEntity);
}

final class ToggleFavouriteError extends FavouriteState {
  final ApiErrorEntity error;
  const ToggleFavouriteError(this.error);
}
