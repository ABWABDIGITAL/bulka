import 'package:equatable/equatable.dart';

sealed class ChooseRegisterationTypeState {
  const ChooseRegisterationTypeState();
}

class ChooseRegisterationTypeInitial extends ChooseRegisterationTypeState {}

class ChangeUserRoleStatus extends ChooseRegisterationTypeState {}
