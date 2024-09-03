import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/authentication/verify_account/data/entity/verify_account_entity.dart';

sealed class VerifyAccountState {
  const VerifyAccountState();
}

final class VerifyAccountInitial extends VerifyAccountState {}

final class VerifyAccountOtpFilled extends VerifyAccountState {}

final class VerifyOtpLoading extends VerifyAccountState {
  const VerifyOtpLoading();
}

final class VerifyOtpSuccess extends VerifyAccountState {
  VerifyOtpSuccess(this.verify);
  final VerifyAccountEntity verify;
}

final class VerifyOtpError extends VerifyAccountState {
  VerifyOtpError(this.error);
  final ApiErrorEntity error;
}
