import 'package:bulka/modules/chats/specific_chat/data/entity/other_side_in_chat_entity.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class OtherSideInChatModel extends OtherSideInChatEntity {
  const OtherSideInChatModel({required super.user});

  factory OtherSideInChatModel.fromJson(Map<String, dynamic> json) {
    return OtherSideInChatModel(
        user: chat.User(
      id: json['id'].toString(),
      firstName: json['name'],
      lastName: '',
      imageUrl: json['avatar'],
      role: chat.Role.admin,
    ));
  }
}
