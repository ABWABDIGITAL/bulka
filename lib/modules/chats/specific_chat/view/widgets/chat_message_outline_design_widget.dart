import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatMessageOutlineDesignWidget extends StatelessWidget {
  const ChatMessageOutlineDesignWidget({
    super.key,
    required this.message,
    required this.child,
  });
  final ChatMessageEntity message;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final bool isMe =
        message.messageOwner.role == ChatClientSideRole.mySide ? true : false;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isMe ? Colors.green[100] : Colors.grey[300],
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(12),
          topRight: const Radius.circular(12),
          bottomLeft:
              isMe ? const Radius.circular(12) : const Radius.circular(0),
          bottomRight:
              isMe ? const Radius.circular(0) : const Radius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
