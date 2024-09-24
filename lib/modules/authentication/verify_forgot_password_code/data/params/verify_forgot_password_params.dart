import 'package:bulka/modules/authentication/verify_forgot_password_code/data/abstractions/account_forgot_password.dart';
import 'package:equatable/equatable.dart';

class VerifyForgotPasswordParams extends Equatable {
  const VerifyForgotPasswordParams({
    required this.code,
    required this.accountForgotPassword,
  });
  final String code;
  final AccountForgotPassword accountForgotPassword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "reset_code": code,
      "phone": accountForgotPassword.phone,
      "phone_code": accountForgotPassword.phoneCode,
      "email": accountForgotPassword.email,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [code, accountForgotPassword];
}
