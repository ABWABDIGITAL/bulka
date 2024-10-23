import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_client_entity.dart';

class ChatClientModel extends ChatClientEntity {
  const ChatClientModel({
    required super.id,
    required super.name,
    required super.role,
    required super.avatar,
  });

  factory ChatClientModel.fromJson(Map<String, dynamic> json) {
    final int? myId = getUserIdFromToken();
    return ChatClientModel(
      id: json['id'],
      name: json['name'],
      role: myId == json['id']
          ? ChatClientSideRole.mySide
          : ChatClientSideRole.otherSide,
      avatar: json['avatar'],
    );
  }
}
