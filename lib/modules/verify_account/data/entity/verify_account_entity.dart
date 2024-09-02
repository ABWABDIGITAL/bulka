import 'package:equatable/equatable.dart';

class VerifyAccountEntity extends Equatable {
  const VerifyAccountEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
