import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/specific_chat/view/screens/specific_chat_screen.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_message_outline_design_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatFileMessageDisplayWidget extends StatelessWidget {
  const ChatFileMessageDisplayWidget(this.message, {super.key});
  final ChatMessageEntity message;

  @override
  Widget build(BuildContext context) {
    final bool isMe =
        message.messageOwner.role == ChatClientSideRole.mySide ? true : false;

    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) const CircleAvatar(child: Icon(Icons.person)),
        ChatMessageOutlineDesignWidget(
          message: message,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Icon(Icons.insert_drive_file, size: 20),
                  Text('Document shared'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    DateFormat('hh:mm a')
                        .format(DateTime.parse(message.createdAt)),
                    style: const TextStyle(fontSize: 10, color: Colors.grey),
                  ),
                  const SizedBox(width: 5),
                  if (isMe)
                    Icon(
                      message.isRead ? Icons.done_all : Icons.done,
                      size: 15,
                      color: message.isRead ? Colors.blue : Colors.grey,
                    ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
