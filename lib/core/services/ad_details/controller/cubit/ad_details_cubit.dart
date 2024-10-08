import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/ad_details/controller/cubit/ad_details_state.dart';
import 'package:bulka/core/services/ad_details/data/params/ad_details_params.dart';
import 'package:bulka/core/services/ad_details/data/repo/ad_details_repo.dart';

class AdDetailsCubit extends Cubit<AdDetailsState> {
  final AdDetailsRepo _adDetailsRepo;
  AdDetailsCubit(this._adDetailsRepo) : super(AdDetailsInitial());
//---------------------------------VARIABLES----------------------------------//

//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> adDetailsStatesHandled(AdDetailsParams params) async {
    emit(const AdDetailsLoading());
    final response = await _adDetailsRepo.adDetails(params);
    response.fold((failure) {
      return emit(AdDetailsError(failure));
    }, (success) async {
      return emit(AdDetailsSuccess(success));
    });
  }
}
