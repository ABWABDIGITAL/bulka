import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_data_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/model/chat_client_model.dart';

class ChatHistoryDataModel extends ChatHistoryDataEntity {
  const ChatHistoryDataModel({
    required super.id,
    required super.mySideInChatEntity,
    required super.otherSideInChatEntity,
    required super.lastMessage,
    required super.lastMessageTime,
    required super.unreadMessagesCount,
  });

  factory ChatHistoryDataModel.fromJson(Map<String, dynamic> json) {
    final int? myId = getUserIdFromToken();
    final Map<String, dynamic> mySideInChatEntity =
        myId == json['sender']['id'] ? json['sender'] : json['receiver'];
    final Map<String, dynamic> otherSideInChatEntity =
        myId == json['sender']['id'] ? json['receiver'] : json['sender'];

    final String lastMessage = checkFromArray(json['messages']['data'])
        ? ((json['messages']['data'] as List).last['message_type'] ==
                ChatMessageTypes.image)
            ? "Image message sent"
            : (json['messages']['data'] as List).last['message']
        : "";

    final String lastMessageTime = checkFromArray(json['messages']['data'])
        ? (json['messages']['data'] as List).last['created_at']
        : DateTime.now().toString();

    int unreadCount = 0;
    if (checkFromArray(json['messages']['data'])) {
      for (var message in json['messages']['data']) {
        if (message['read_at'] == null || message['read_at'] == false) {
          unreadCount++;
        }
      }
    }

    return ChatHistoryDataModel(
      id: json['id'],
      mySideInChatEntity: ChatClientModel.fromJson(mySideInChatEntity),
      otherSideInChatEntity: ChatClientModel.fromJson(otherSideInChatEntity),
      lastMessage: lastMessage,
      lastMessageTime: lastMessageTime,
      unreadMessagesCount: unreadCount,
    );
  }
}
