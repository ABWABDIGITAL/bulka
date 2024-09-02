import 'package:bulka/core/utils/constant/api_constance.dart';

abstract class AccountForgotPassword {
  late String endPoint;
  Map<String, dynamic> returnedMap();
}

class GetForgotPasswordCodeViaEmail implements AccountForgotPassword {
  GetForgotPasswordCodeViaEmail({required this.email});
  final String email;
  @override
  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"email": email};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  String endPoint = ApiConstance.forgotPasswordWithEmail;
}

class GetForgotPasswordCodeViaPhone implements AccountForgotPassword {
  GetForgotPasswordCodeViaPhone({required this.phone});
  final String phone;
  @override
  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"phone": phone};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  String endPoint = ApiConstance.forgotPasswordWithPhone;
}
