import 'package:equatable/equatable.dart';

class PaySubscribtionEntity extends Equatable {
  const PaySubscribtionEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
