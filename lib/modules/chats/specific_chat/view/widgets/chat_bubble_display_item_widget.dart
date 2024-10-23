import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_message_entity.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_audio_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_contact_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_file_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_image_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_location_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_text_message_display_widget.dart';
import 'package:bulka/modules/chats/specific_chat/view/widgets/chat_video_message_display_widget.dart';
import 'package:flutter/material.dart';

class ChatBubbleDisplayItemWidget extends StatelessWidget {
  const ChatBubbleDisplayItemWidget(this.message, {super.key});
  final ChatMessageEntity message;

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case ChatMessageTypes.text:
        return ChatTextMessageDisplayWidget(message);
      case ChatMessageTypes.video:
        return ChatVideoMessageDisplayWidget(message);
      case ChatMessageTypes.image:
        return ChatImageMessageDisplayWidget(message);
      case ChatMessageTypes.audio:
        return ChatAudioMessageDisplayWidget(message);
      case ChatMessageTypes.file:
        return ChatFileMessageDisplayWidget(message);
      case ChatMessageTypes.location:
        return ChatLocationMessageDisplayWidget(message);
      case ChatMessageTypes.contact:
        return ChatContactMessageDisplayWidget(message);
    }
  }
}
