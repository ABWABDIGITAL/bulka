import 'package:equatable/equatable.dart';

class VerifyForgotPasswordEntity extends Equatable {
  const VerifyForgotPasswordEntity({
    required this.message,
    required this.isCodeCorrect,
  });
  final String? message;
  final bool isCodeCorrect;
  @override
  List<Object?> get props => [message, isCodeCorrect];
}
