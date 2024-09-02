import 'package:bulka/modules/home_templet/controllers/home_state.dart';
import 'package:bulka/modules/home_templet/data/entity/banner_entity.dart';
import 'package:bulka/modules/home_templet/data/repo/home_repo.dart';
import 'package:bloc/bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeStateInitial());
//---------------------------------VARIABLES----------------------------------//

//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUESTS-----------------------------------//
  Future<void> homeBannersStatesHandled() async {
    emit(GetHomeBannersLoadingState());
    final response = await _homeRepo.homeBanners();
    response.fold((failure) {
      return emit(GetHomeBannersErrorState(failure));
    }, (success) async {
      return emit(GetHomeBannersSuccessState(success));
    });
  }
}
