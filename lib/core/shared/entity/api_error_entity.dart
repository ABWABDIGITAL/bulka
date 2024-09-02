import 'package:equatable/equatable.dart';

class ApiErrorEntity extends Equatable {
  const ApiErrorEntity({
    required this.status,
    required this.code,
    required this.message,
    required this.errors,
  });
  final bool status;
  final int code;
  final String message;
  final List<String>? errors;
  @override
  List<Object?> get props => [status, code, message, errors];
}
