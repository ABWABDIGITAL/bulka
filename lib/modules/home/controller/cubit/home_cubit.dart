import 'package:bloc/bloc.dart';
import 'package:bulka/modules/home/controller/cubit/home_state.dart';
import 'package:bulka/modules/home/data/entity/home_entity.dart';
import 'package:bulka/modules/home/data/repo/home_repo.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeInitial());
//---------------------------------VARIABLES----------------------------------//
  HomeEntity? homeEntity;
//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
  Future<void> homeStatesHandled() async {
    emit(const GetHomeLoading());
    final response = await _homeRepo.home();
    response.fold((failure) {
      return emit(GetHomeError(failure));
    }, (success) {
      homeEntity = success;
      return emit(GetHomeSuccess(success));
    });
  }
}
