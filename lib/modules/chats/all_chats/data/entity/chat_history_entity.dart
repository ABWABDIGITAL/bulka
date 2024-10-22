import 'package:bulka/core/shared/entity/paggination_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_data_entity.dart';
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ChatHistoryEntity extends Equatable {
  ChatHistoryEntity({required this.data, required this.paggination});
  List<ChatHistoryDataEntity> data;
  PagginationEntity paggination;

  @override
  List<Object?> get props => [data, paggination];
}
