part of 'settings_cubit.dart';

sealed class SettingsState {
  const SettingsState();
}

final class SettingsInitial extends SettingsState {}

final class SettingsNotificationChanged extends SettingsState {}

final class SettingsLightModeChanged extends SettingsState {}
