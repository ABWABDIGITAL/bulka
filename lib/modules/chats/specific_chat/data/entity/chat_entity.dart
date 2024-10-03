import 'package:bulka/modules/chats/specific_chat/data/entity/my_side_in_chat_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/other_side_in_chat_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

class ChatEntity {
  ChatEntity({
    required this.mySideInChatEntity,
    required this.otherSideInChatEntity,
    required this.messages,
  });
  final MySideInChatEntity mySideInChatEntity;
  final OtherSideInChatEntity otherSideInChatEntity;
  List<types.Message> messages;
}
