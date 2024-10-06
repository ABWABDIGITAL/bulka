import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/choose_interests/data/entity/interests_entity.dart';
import 'package:bulka/modules/choose_interests/data/entity/send_interests_entity.dart';

sealed class ChooseInterestsState {
  const ChooseInterestsState();
}

final class ChooseInterestsInitial extends ChooseInterestsState {}

final class ChoosenInterstUpdated extends ChooseInterestsState {}

final class GetInterestsLoading extends ChooseInterestsState {
  const GetInterestsLoading();
}

final class GetInterestsSuccess extends ChooseInterestsState {
  GetInterestsSuccess(this.interests);
  final List<InterestsEntity> interests;
}

final class GetInterestsError extends ChooseInterestsState {
  GetInterestsError(this.error);
  final ApiErrorEntity error;
}

final class SendInterestsLoading extends ChooseInterestsState {
  const SendInterestsLoading();
}

final class SendInterestsSuccess extends ChooseInterestsState {
  SendInterestsSuccess(this.sendInterests);
  final SendInterestsEntity sendInterests;
}

final class SendInterestsError extends ChooseInterestsState {
  SendInterestsError(this.error);
  final ApiErrorEntity error;
}
