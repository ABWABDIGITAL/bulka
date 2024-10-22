part of 'settings_cubit.dart';

sealed class SettingsState {
  const SettingsState();
}

final class SettingsInitial extends SettingsState {}

final class SettingsNotificationChanged extends SettingsState {}

final class SettingsLightModeChanged extends SettingsState {}

//----------------------------------------------notification toggle----------------------------------------------//
final class SettingsNotificationToggleLoading extends SettingsState {}

final class SettingsNotificationToggleSuccess extends SettingsState {}

final class SettingsNotificationToggleFailure extends SettingsState {
  final ApiErrorEntity error;

  const SettingsNotificationToggleFailure(this.error);
}
