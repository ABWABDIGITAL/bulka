import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/params/all_chat_params.dart';
import 'package:bulka/modules/chats/specific_chat/data/entity/chat_entity.dart';
import 'package:bulka/modules/chats/specific_chat/data/model/chat_model.dart';
import 'package:dartz/dartz.dart';

class AllChatRepo {
  const AllChatRepo();

  // Future<Either<ApiErrorEntity, ChatEntity>> allChats(
  //     AllChatParams params) async {
  //   try {
  //     List<chat.Message> messages = [];
  //     chat.User user = const chat.User(
  //       id: 'user-id',
  //       firstName: 'Adel',
  //       lastName: 'Mohsen',
  //       imageUrl:
  //           'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
  //       role: chat.Role.user,
  //     );
  //     chat.User doctor = const chat.User(
  //       id: 'doctor-id',
  //       firstName: 'Ahmed',
  //       lastName: 'Khaled',
  //       imageUrl:
  //           'https://plus.unsplash.com/premium_photo-1683121366070-5ceb7e007a97?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHx8MA%3D%3D',
  //       role: chat.Role.agent,
  //     );
  //     final message1 = chat.TextMessage(
  //       author: user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: const Uuid().v4(),
  //       text: 'Hello Doctor, how are you today?',
  //     );
  //     final message2 = chat.TextMessage(
  //       author: doctor,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: const Uuid().v4(),
  //       text: 'Hello, I’m fine, how can I help you?',
  //     );
  //     messages.insert(0, message2);
  //     messages.insert(0, message1);
  //     return Right(ChatModel(
  //       mySideInChatEntity: MySideInChatEntity(user: user),
  //       otherSideInChatEntity: OtherSideInChatEntity(user: doctor),
  //       messages: messages,
  //     ));
  //   } catch (error) {
  //     return Left(ErrorHandler.handleError(error));
  //   }
  // }
}
