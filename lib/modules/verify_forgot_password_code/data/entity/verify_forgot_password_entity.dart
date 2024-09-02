import 'package:equatable/equatable.dart';

class VerifyForgotPasswordEntity extends Equatable {
  const VerifyForgotPasswordEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
