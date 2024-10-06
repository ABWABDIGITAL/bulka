import 'package:equatable/equatable.dart';

class CreateAdEntity extends Equatable {
  final String message;

  const CreateAdEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
