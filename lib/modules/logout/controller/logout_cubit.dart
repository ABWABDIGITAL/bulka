import 'package:bloc/bloc.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:equatable/equatable.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit() : super(LogoutInitial());
}
