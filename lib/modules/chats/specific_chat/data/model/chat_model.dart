// ignore_for_file: depend_on_referenced_packages
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/chat_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/model/my_side_in_chat_model.dart';
import 'package:bulka/modules/chats/specific_chat/data/model/other_side_in_chat_model.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as chat;

class ChatModel extends ChatEntity {
  ChatModel({
    required super.mySideInChatEntity,
    required super.otherSideInChatEntity,
    required super.messages,
  });
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    List<chat.Message> messages = [];
    final int? userId = getUserIdFromToken();

    // if (checkFromArray(json['messages'])) {
    //   messages = (json['messages'] as List)
    //       .map(
    //         (e) => chat.TextMessage(
    //           author: MySideInChatModel.fromJson(json['user']).user,
    //           createdAt: DateTime.now().millisecondsSinceEpoch,
    //           id: const Uuid().v4(),
    //           text: json['message'],
    //         ),
    //       )
    //       .toList();
    // }

    return ChatModel(
      mySideInChatEntity: json['sender']['id'] == userId
          ? MySideInChatModel.fromJson(json['sender'])
          : MySideInChatModel.fromJson(json['receiver']),
      otherSideInChatEntity: json['sender']['id'] == userId
          ? OtherSideInChatModel.fromJson(json['other'])
          : OtherSideInChatModel.fromJson(json['other']),
      messages: messages,
    );
  }
}
