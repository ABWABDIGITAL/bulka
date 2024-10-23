import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_client_entity.dart';
import 'package:equatable/equatable.dart';

class ChatMessageEntity extends Equatable {
  const ChatMessageEntity({
    required this.id,
    required this.message,
    required this.type,
    required this.createdAt,
    required this.messageOwner,
    this.messageAttachment,
    this.readAt,
    required this.isRead,
  });
  final int id;
  final String message;
  final ChatMessageTypes type;
  final String? messageAttachment;
  final String? readAt;
  final String createdAt;
  final ChatClientEntity messageOwner;
  final bool isRead;
  @override
  List<Object?> get props => [
        id,
        message,
        type,
        messageAttachment,
        readAt,
        createdAt,
        messageOwner,
        isRead
      ];
}
