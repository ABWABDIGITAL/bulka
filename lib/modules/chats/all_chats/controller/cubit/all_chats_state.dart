import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_entity.dart';

sealed class AllChatsState {
  const AllChatsState();
}

final class AllChatsInitial extends AllChatsState {
  const AllChatsInitial();
}

final class AllChatsLoading extends AllChatsState {
  const AllChatsLoading();
}

final class AllChatsSuccess extends AllChatsState {
  final ChatHistoryEntity chatHistory;
  const AllChatsSuccess(this.chatHistory);
}

final class AllChatsError extends AllChatsState {
  final ApiErrorEntity error;
  const AllChatsError(this.error);
}
