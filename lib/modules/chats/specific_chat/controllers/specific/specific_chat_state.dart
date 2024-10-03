import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/chat_entity.dart';

sealed class SpecificChatState {
  const SpecificChatState();
}

final class SpecificChatInitial extends SpecificChatState {}

final class UpdateChatUi extends SpecificChatState {}

final class UpdateChatFormField extends SpecificChatState {}

final class GetSpecificChatLoading extends SpecificChatState {}

final class GetSpecificChatSuccess extends SpecificChatState {
  const GetSpecificChatSuccess(this.chat);
  final ChatEntity chat;
}

final class GetSpecificChatFailure extends SpecificChatState {
  const GetSpecificChatFailure(this.error);
  final ApiErrorEntity error;
}
