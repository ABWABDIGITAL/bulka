import 'package:bloc/bloc.dart';
import 'package:bulka/modules/chats/all_chats/controller/cubit/all_chats_state.dart';
import 'package:bulka/modules/chats/all_chats/data/repo/all_chat_repo.dart';

class AllChatsCubit extends Cubit<AllChatsState> {
  final AllChatRepo _allChatRepo;
  AllChatsCubit(this._allChatRepo) : super(AllChatsInitial());
//---------------------------------VARIABLES----------------------------------//

//---------------------------------FUNCTIONS----------------------------------//

//----------------------------------REQUEST-----------------------------------//
}
