import 'package:bulka/modules/chats/specific_chat/data/entity/my_side_in_chat_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/other_side_in_chat_entity.dart';
import 'package:equatable/equatable.dart';

class ChatHistoryDataEntity extends Equatable {
  const ChatHistoryDataEntity({
    required this.id,
    required this.mySideInChatEntity,
    required this.otherSideInChatEntity,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.unreadMessagesCount,
  });
  final int id;
  final MySideInChatEntity mySideInChatEntity;
  final OtherSideInChatEntity otherSideInChatEntity;
  final String lastMessage;
  final String lastMessageTime;
  final int unreadMessagesCount;

  @override
  List<Object?> get props => [
        id,
        mySideInChatEntity,
        otherSideInChatEntity,
        lastMessage,
        lastMessageTime,
        unreadMessagesCount,
      ];
}
