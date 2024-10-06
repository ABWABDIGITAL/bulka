import 'package:equatable/equatable.dart';

class ForgotPasswordWithEmailParams extends Equatable {
  const ForgotPasswordWithEmailParams({
    required this.email,
    required this.emailCode,
  });
  final String email;
  final String emailCode;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "email": email,
      "email_code": emailCode,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [email, emailCode];
}
