import 'package:equatable/equatable.dart';

class VerifyAccountWithPhoneParams extends Equatable {
  const VerifyAccountWithPhoneParams({
    required this.endPoint,
    required this.phoneCode,
    required this.resetCode,
  });
  final String endPoint;
  final String phoneCode;
  final String resetCode;

  @override
  List<Object?> get props => [endPoint, phoneCode, resetCode];
}
