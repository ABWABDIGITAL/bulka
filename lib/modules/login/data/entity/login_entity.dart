import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String message;
  const LoginEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
