import 'package:bloc/bloc.dart';
import 'package:bulka/modules/settings/data/repo/settings_repo.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());
  //----------------------------------variables-----------------------------------------//
  SettingsRepo _settingsRepo;
  bool _isNotificationEnabled = true;
  bool _isLightMode = false;

  //----------------------------------functions-----------------------------------------//
  set isNotificationEnabled(bool value) => _isNotificationEnabled = value;
  bool get isNotificationEnabled => _isNotificationEnabled;

  set isLightMode(bool value) => _isLightMode = value;
  bool get isLightMode => _isLightMode;

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
