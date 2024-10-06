import 'package:bulka/core/services/profile_info/data/entity/my_profile_info_entity.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class MyProfileInfoState {
  const MyProfileInfoState();
}

final class MyProfileInfoInitial extends MyProfileInfoState {}

final class MyProfileInfoLoading extends MyProfileInfoState {
  const MyProfileInfoLoading();
}

final class MyProfileInfoSuccess extends MyProfileInfoState {
  final MyProfileInfoEntity info;
  MyProfileInfoSuccess(this.info);
}

final class MyProfileInfoError extends MyProfileInfoState {
  MyProfileInfoError(this.error);
  final ApiErrorEntity error;
}
