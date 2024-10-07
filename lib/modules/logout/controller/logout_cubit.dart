import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
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

    final result = await _logoutRepo.logout();
    /* SharedPrefHelper.removeData(SharedKeys().token);
    SharedPrefHelper.setData(key: SharedKeys().isLogin, value: false);
    SharedPrefHelper.removeData(SharedKeys().userType); */
    result.fold(
      (error) {
        emit(LogoutError(error));
      },
      (success) {
        emit(
         LogoutLoaded(success),
      );
      },
    );
  }
}
