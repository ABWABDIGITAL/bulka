import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/services/network/dio_helper.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/model/chat_history_model.dart';
import 'package:bulka/modules/chats/all_chats/data/params/all_chat_params.dart';
import 'package:dartz/dartz.dart';

class AllChatRepo {
  const AllChatRepo();

  Future<Either<ApiErrorEntity, ChatHistoryEntity>> chatHistory(
      AllChatParams? params) async {
    try {
      int? myId = getUserIdFromToken();
      if (myId == null) {
        return const Left(
          ApiErrorEntity(
            message: "User id not found",
            status: false,
            code: 401,
            errors: [],
          ),
        );
      }
      final response = await DioHelper.get(
        ApiConstance.allChats,
        // queries: params?.returnedMap(),
      );

      return Right(ChatHistoryModel.fromJson(response.data));
    } catch (error) {
      return Left(ErrorHandler.handleError(error));
    }
  }
}
