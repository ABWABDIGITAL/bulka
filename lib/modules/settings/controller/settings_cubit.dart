import 'package:bulka/core/services/profile_info/controller/cubit/my_profile_info_cubit.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/settings/data/repo/settings_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit(this._settingsRepo) : super(SettingsInitial());
  //----------------------------------variables-----------------------------------------//
  final SettingsRepo _settingsRepo;
  bool? _isNotificationEnabled;
  bool _isLightMode = false;

  //----------------------------------functions-----------------------------------------//
  set isNotificationEnabled(bool value) => _isNotificationEnabled = value;
  bool get isNotificationEnabled => _isNotificationEnabled!;

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

  void initValues(BuildContext context) {
    isNotificationEnabled =
        context.read<MyProfileInfoCubit>().profileEntity!.isNotified;
    //   isLightMode = context.read<SettingsCubit>().isLightMode;
  }

  //----------------------------------requests------------------------------------------//
  void toggleNotification() async {
    emit(SettingsNotificationToggleLoading());
    try {
      await _settingsRepo.toggleNotification();
      emit(SettingsNotificationToggleSuccess());
    } on ApiErrorEntity catch (e) {
      emit(SettingsNotificationToggleFailure(e));
    }
  }
}
