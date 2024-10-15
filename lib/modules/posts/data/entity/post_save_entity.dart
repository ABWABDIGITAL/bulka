import 'package:equatable/equatable.dart';

class PostSaveEntity extends Equatable {
  final String message;

  const PostSaveEntity({required this.message});

  @override
  List<Object?> get props => [message];
}
