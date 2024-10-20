import 'package:bulka/core/shared/entity/api_error_entity.dart';

sealed class AllChatsState {
  const AllChatsState();
}

final class AllChatsInitial extends AllChatsState {}

final class AllChatsLoading extends AllChatsState {}

final class AllChatsSuccess extends AllChatsState {}

final class AllChatsError extends AllChatsState {
  final ApiErrorEntity error;
  const AllChatsError(this.error);
}
