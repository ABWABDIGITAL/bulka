import 'package:bulka/modules/chats/specific_chat/data/entity/my_side_in_chat_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class MySideInChatModel extends MySideInChatEntity {
  const MySideInChatModel({required super.user});

  factory MySideInChatModel.fromJson(Map<String, dynamic> json) {
    return MySideInChatModel(
      user: chat.User(
        id: json['id'].toString(),
        firstName: json['name'],
        lastName: '',
        imageUrl: json['avatar'],
        role: chat.Role.user,
      ),
    );
  }
}
