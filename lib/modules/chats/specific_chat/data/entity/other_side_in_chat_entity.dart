import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class OtherSideInChatEntity extends Equatable {
  const OtherSideInChatEntity({required this.user});
  final chat.User user;

  @override
  List<Object?> get props => [user];
}
