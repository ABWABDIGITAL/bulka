import 'package:bulka/modules/chats/specific_chat/data/entity/my_side_in_chat_entity.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class MySideInChatModel extends MySideInChatEntity {
  const MySideInChatModel({required super.user});

  factory MySideInChatModel.fromJson(Map<String, dynamic> json) {
    return const MySideInChatModel(
      user: chat.User(
        id: 'user-id',
        firstName: 'Adel',
        lastName: 'Mohsen',
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1720886073981-f975d3dc93f8?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
        role: chat.Role.user,
      ),
    );
  }
}
