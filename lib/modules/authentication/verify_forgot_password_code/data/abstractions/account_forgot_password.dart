import 'package:bulka/core/utils/constant/api_constance.dart';

abstract class AccountForgotPassword {
  late String endPoint;
  late String? phone;
  late String? phoneCode;
  late String? email;
}

class GetForgotPasswordCodeViaEmail implements AccountForgotPassword {
  GetForgotPasswordCodeViaEmail({required this.email});

  @override
  String endPoint = ApiConstance.forgotPasswordWithEmail;

  @override
  String? email;

  @override
  String? phone;

  @override
  String? phoneCode;
}

class GetForgotPasswordCodeViaPhone implements AccountForgotPassword {
  GetForgotPasswordCodeViaPhone({
    required this.phone,
    required this.phoneCode,
  });

  @override
  String endPoint = ApiConstance.forgotPasswordWithPhone;

  @override
  String? email;

  @override
  String? phone;

  @override
  String? phoneCode;
}
