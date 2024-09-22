import 'package:equatable/equatable.dart';

class ResendVerifyPhoneEntity extends Equatable {
  const ResendVerifyPhoneEntity({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
