import 'package:bloc/bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());
  //----------------------------------variables-----------------------------------------//

  bool isNotificationEnabled = true;
  bool isLightMode = false;
  //----------------------------------functions-----------------------------------------//
  void changeNotificationStatus(bool value) {
    isNotificationEnabled = value;
    emit(SettingsNotificationChanged());
  }

  void changeLightModeStatus(bool value) {
    isLightMode = value;
    emit(SettingsLightModeChanged());
  }
  //----------------------------------requests------------------------------------------//
}
