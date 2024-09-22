import 'package:equatable/equatable.dart';

class ChooseVerifyMethodParams extends Equatable {
  const ChooseVerifyMethodParams({
    required this.email,
    required this.phone,
    required this.phoneCode,
  });
  final String email;
  final String phone;
  final String phoneCode;

  @override
  List<Object?> get props => [email, phone, phoneCode];
}
