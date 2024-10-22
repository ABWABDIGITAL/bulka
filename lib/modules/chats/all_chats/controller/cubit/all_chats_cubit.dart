import 'package:bloc/bloc.dart';
import 'package:bulka/core/utils/enums/enums.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_state.dart';
import 'package:bulka/modules/chats/all_chats/data/entity/chat_history_entity.dart';
import 'package:bulka/modules/chats/all_chats/data/params/all_chat_params.dart';
import 'package:bulka/modules/chats/all_chats/data/repo/all_chat_repo.dart';

class AllChatsCubit extends Cubit<AllChatsState> {
  final AllChatRepo _allChatRepo;
  AllChatsCubit(this._allChatRepo) : super(const AllChatsInitial());
//---------------------------------VARIABLES----------------------------------//
  ChatHistoryEntity? _chatHistoryEntity;
  int page = 1;
  ChatHistoryKeywords _keyWords = ChatHistoryKeywords.all;
  ChatHistoryTypes _chatType = ChatHistoryTypes.all;

//---------------------------------FUNCTIONS----------------------------------//
  ChatHistoryEntity? get chatHistoryEntity => _chatHistoryEntity;
  ChatHistoryKeywords get keyWords => _keyWords;
  ChatHistoryTypes get chatType => _chatType;

  set chatType(ChatHistoryTypes value) {
    _chatType = value;
  }

  set setKeyWords(ChatHistoryKeywords keyWords) {
    _keyWords = keyWords;
  }

//----------------------------------REQUEST-----------------------------------//
  Future<void> chatHistoryStatesHandled({AllChatParams? params}) async {
    emit(const AllChatsLoading());
    final response = await _allChatRepo.chatHistory(params ??
        AllChatParams(
          page: page,
          keyword: _keyWords.name,
          type: _chatType == ChatHistoryTypes.all ? null : _chatType.name,
        ));
    response.fold((failure) {
      return emit(AllChatsError(failure));
    }, (success) async {
      if (_chatHistoryEntity == null || page == 1) {
        _chatHistoryEntity = success;
      } else {
        _chatHistoryEntity!.paggination = success.paggination;
        if (success.data.isNotEmpty) {
          success.data.map((e) => _chatHistoryEntity!.data.add(e)).toList();
        }
      }
      return emit(AllChatsSuccess(success));
    });
  }
}
