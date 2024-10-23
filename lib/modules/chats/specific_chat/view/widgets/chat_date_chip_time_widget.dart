import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ChatDateChipTimeWidget extends StatelessWidget {
  const ChatDateChipTimeWidget(this.message, {super.key});
  final ChatMessageEntity message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
          DateFormat('yyyy-MM-dd').format(DateTime.parse(message.createdAt)),
          style: const TextStyle(color: Colors.grey)),
    );
  }
}
