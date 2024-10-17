import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'user_language_state.dart';

class UserLanguageCubit extends Cubit<UserLanguageState> {
  UserLanguageCubit() : super(UserLanguageInitial());
}
