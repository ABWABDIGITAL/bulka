import 'package:equatable/equatable.dart';

class ToggleFavouriteEntity extends Equatable {
  const ToggleFavouriteEntity({required this.message});
  final String message;

  @override
  List<Object?> get props => [message];
}
