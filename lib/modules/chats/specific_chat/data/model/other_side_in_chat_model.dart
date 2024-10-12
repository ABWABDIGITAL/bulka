import 'package:bulka/modules/chats/specific_chat/data/entity/other_side_in_chat_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class OtherSideInChatModel extends OtherSideInChatEntity {
  const OtherSideInChatModel({required super.user});

  factory OtherSideInChatModel.fromJson(Map<String, dynamic> json) {
    return const OtherSideInChatModel(
        user: chat.User(
      id: 'doctor-id',
      firstName: 'Ahmed',
      lastName: 'Khaled',
      imageUrl:
          'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
      role: chat.Role.admin,
    ));
  }
}
