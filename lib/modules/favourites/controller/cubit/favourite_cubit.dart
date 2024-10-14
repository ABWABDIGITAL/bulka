import 'package:bloc/bloc.dart';
import 'package:bulka/modules/favourites/controller/cubit/favourite_state.dart';
import 'package:bulka/modules/favourites/data/params/toggle_favourite_params.dart';
import 'package:bulka/modules/favourites/data/repo/favourite_repo.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteRepo _favouriteRepo;
  FavouriteCubit(this._favouriteRepo) : super(FavouriteInitial());

//---------------------------------VARIABLES----------------------------------//

//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> toggleStatesHandled(ToggleFavouriteParams params) async {
    emit(const ToggleFavouriteLoading());
    final response = await _favouriteRepo.toggle(params);
    response.fold((failure) {
      return emit(ToggleFavouriteError(failure));
    }, (success) async {
      return emit(ToggleFavouriteSuccess(success));
    });
  }
}
