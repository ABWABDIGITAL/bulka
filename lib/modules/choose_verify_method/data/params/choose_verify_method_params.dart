import 'package:equatable/equatable.dart';

class ChooseVerifyMethodParams extends Equatable {
  const ChooseVerifyMethodParams({required this.email, required this.phone});
  final String email;
  final String phone;

  @override
  List<Object?> get props => [email, phone];
}
