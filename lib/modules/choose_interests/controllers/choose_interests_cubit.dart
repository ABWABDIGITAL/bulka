import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/choose_interests/controllers/choose_interests_state.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/params/send_interests_params.dart';
import 'package:bulka/modules/choose_interests/data/repo/interests_repo.dart';

class ChooseInterestsCubit extends Cubit<ChooseInterestsState> {
  final InterestsRepo _interestsRepo;
  ChooseInterestsCubit(this._interestsRepo) : super(ChooseInterestsInitial());
//---------------------------------VARIABLES----------------------------------//
  final List<InterestsEntity> _choosenInterests = [];
  List<InterestsEntity>? _allInterests;
//---------------------------------FUNCTIONS----------------------------------//
  List<InterestsEntity> get choosenInterests => _choosenInterests;
  List<InterestsEntity>? get allInterests => _allInterests;

  void checkAndToggleInterest(InterestsEntity interest) {
    if (_choosenInterests.contains(interest)) {
      _choosenInterests.remove(interest);
    } else {
      _choosenInterests.add(interest);
    }
    emit(ChoosenInterstUpdated());
  }

  bool isInterestExist(InterestsEntity interest) {
    return _choosenInterests.contains(interest);
  }

  _ifChoosenIntrestEmpty() {
    if (_choosenInterests.isEmpty) {
      return emit(
        SendInterestsError(
          const ApiErrorEntity(
            code: ResponseCode.validationError,
            errors: ['please choose atleast one'],
            message: 'please choose atleast one',
            status: false,
          ),
        ),
      );
    }
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> chooseInterestsStatesHandled() async {
    emit(const GetInterestsLoading());
    final response = await _interestsRepo.getInterests();
    response.fold((failure) {
      return emit(GetInterestsError(failure));
    }, (success) async {
      _allInterests = success;
      return emit(GetInterestsSuccess(success));
    });
  }

  Future<void> sendInterestsStatesHandled() async {
    _ifChoosenIntrestEmpty();
    emit(const SendInterestsLoading());
    final response = await _interestsRepo.sendInterestsData(
      SendInterestsParams(choosenInterests: choosenInterests),
    );
    response.fold((failure) {
      return emit(SendInterestsError(failure));
    }, (success) async {
      return emit(SendInterestsSuccess(success));
    });
  }
}
