import 'package:bulka/core/shared/models/paggination_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/model/chat_history_data_model.dart';

// ignore: must_be_immutable
class ChatHistoryModel extends ChatHistoryEntity {
  ChatHistoryModel({
    required super.data,
    required super.paggination,
  });

  factory ChatHistoryModel.fromJson(Map<String, dynamic> json, int myId) {
    return ChatHistoryModel(
      data: checkFromArray(json['data'])
          ? (json['data'] as List)
              .map((e) => ChatHistoryDataModel.fromJson(e, myId))
              .toList()
          : [],
      paggination: PagginationModel.fromJson(json['meta']),
    );
  }
}
