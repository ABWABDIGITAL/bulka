import 'package:equatable/equatable.dart';

class ResetPasswordParams extends Equatable {
  const ResetPasswordParams({
    required this.newPassword,
    required this.confirmPassword,
  });
  final String newPassword;
  final String confirmPassword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "newPassword": newPassword,
      "confirmPassword": confirmPassword,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [newPassword, confirmPassword];
}
