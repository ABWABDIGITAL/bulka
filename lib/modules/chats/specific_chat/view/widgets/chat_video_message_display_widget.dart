import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_message_outline_design_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatVideoMessageDisplayWidget extends StatelessWidget {
  const ChatVideoMessageDisplayWidget(this.message, {super.key});
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
              Container(
                height: 150,
                width: 200,
                color: Colors.black12,
                child: const Center(child: Icon(Icons.videocam, size: 50)),
              ),
              const Text('Video'),
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
