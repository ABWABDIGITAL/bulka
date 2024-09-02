import 'package:equatable/equatable.dart';

class ForgotPasswordWithPhoneParams extends Equatable {
  const ForgotPasswordWithPhoneParams({required this.phone});

  final String phone;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"phone": phone};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object> get props => [phone];
}
