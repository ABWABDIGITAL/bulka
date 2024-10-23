import 'package:bulka/modules/chats/all_chats/data/entity/chat_client_entity.dart';
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
  final ChatClientEntity mySideInChatEntity;
  final ChatClientEntity otherSideInChatEntity;
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
