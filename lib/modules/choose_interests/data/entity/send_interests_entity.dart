import 'package:equatable/equatable.dart';

class SendInterestsEntity extends Equatable {
  const SendInterestsEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
