import 'package:bulka/core/shared/abstractions/account_forgot_password.dart';
import 'package:equatable/equatable.dart';

class VerifyForgotPasswordParams extends Equatable {
  const VerifyForgotPasswordParams({
    required this.code,
    required this.accountForgotPassword,
  });
  final String code;
  final AccountForgotPassword accountForgotPassword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"code": code};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [code, accountForgotPassword];
}
