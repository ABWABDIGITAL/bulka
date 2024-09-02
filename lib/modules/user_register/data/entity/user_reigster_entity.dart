import 'package:equatable/equatable.dart';

class UserRegisterEntity extends Equatable {
  const UserRegisterEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
