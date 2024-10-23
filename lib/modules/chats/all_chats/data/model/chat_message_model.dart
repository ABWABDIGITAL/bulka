import 'package:bulka/core/utils/enums/enum_switch_return.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/model/chat_client_model.dart';

class ChatMessageModel extends ChatMessageEntity {
  const ChatMessageModel({
    required super.id,
    required super.message,
    required super.type,
    required super.createdAt,
    required super.messageAttachment,
    required super.readAt,
    required super.messageOwner,
    required super.isRead,
  });

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) {
    return ChatMessageModel(
      id: json['id'],
      message: json['message'],
      type: EnumSwitchReturn.getMessageType(json['message_type']),
      messageAttachment: json['message_attachment'],
      readAt: json['read_at'] == null || json['read_at'] == false
          ? null
          : json['read_at'],
      createdAt: json['created_at'],
      messageOwner: ChatClientModel.fromJson(json['mesageOwner']),
      isRead: json['isRead'] ?? false,
    );
  }
}
