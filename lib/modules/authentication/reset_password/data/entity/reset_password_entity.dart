import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
  const ResetPasswordEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
