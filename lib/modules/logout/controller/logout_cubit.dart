import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:bulka/core/services/cache/shared_pref.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/shared_pref_keys.dart';
import 'package:bulka/modules/logout/data/params/logout_params.dart';
import 'package:bulka/modules/logout/data/repo/logout_repo.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(
    this._logoutRepo,
  ) : super(LogoutInitial());

  //---------------------------------variables---------------------------------//
  final LogoutRepo _logoutRepo;
  //---------------------------------functions--------------------------------//
  //---------------------------------requests---------------------------------//
  Future<void> logout() async {
    emit(LogoutLoading());

    final params = LogoutParams(
        deviceToken:
            SharedPrefHelper.getString(SharedPrefKeys.userToken).toString(),
        type: Platform.operatingSystem);
    final result = await _logoutRepo.logout(params);
    await SharedPrefHelper.removeString(SharedPrefKeys.userToken);
    // SharedPrefHelper.setData(key: SharedPrefKeys., value: false);
    // SharedPrefHelper.removeData(SharedKeys().userType);
    result.fold(
      (error) {
        emit(LogoutError(error));
      },
      (success) {
        emit(LogoutLoaded(success));
      },
    );
  }
}
