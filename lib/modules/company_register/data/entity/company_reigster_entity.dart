import 'package:equatable/equatable.dart';

class CompanyRegisterEntity extends Equatable {
  const CompanyRegisterEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
