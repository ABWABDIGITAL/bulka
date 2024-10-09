import 'package:bloc/bloc.dart';
import 'package:bulka/modules/see_all_ad/controller/see_all_ad_state.dart';
import 'package:bulka/modules/see_all_ad/data/entity/see_all_entity.dart';
import 'package:bulka/modules/see_all_ad/data/params/see_all_params.dart';
import 'package:bulka/modules/see_all_ad/data/repo/see_all_repo.dart';

class SeeAllAdCubit extends Cubit<SeeAllAdState> {
  final SeeAllAdRepo _seeAllAdRepo;
  SeeAllAdCubit(this._seeAllAdRepo) : super(SeeAllAdInitial());
//---------------------------------VARIABLES----------------------------------//
  SeeAllEntity? seeAllAdEntity;
  int page = 0;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> seeAllAdStatesHandled(SeeAllParams params) async {
    emit(const SeeAllAdLoading());
    final response = await _seeAllAdRepo.seeAll(params);
    response.fold((failure) {
      return emit(SeeAllAdError(failure));
    }, (success) async {
      if (seeAllAdEntity == null) {
        seeAllAdEntity = success;
      } else {
        seeAllAdEntity!.paggination = success.paggination;
        if (success.ads.isNotEmpty) {
          success.ads.map((e) => seeAllAdEntity!.ads.add(e)).toList();
        }
      }
      return emit(SeeAllAdSuccess(success));
    });
  }
}
