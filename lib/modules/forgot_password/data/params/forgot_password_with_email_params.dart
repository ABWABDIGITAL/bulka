import 'package:equatable/equatable.dart';

class ForgotPasswordWithEmailParams extends Equatable {
  const ForgotPasswordWithEmailParams({required this.email});

  final String email;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "email": email,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object> get props => [email];
}
