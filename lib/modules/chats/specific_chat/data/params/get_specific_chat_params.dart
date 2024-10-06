import 'package:equatable/equatable.dart';

class GetSpecificChatParams extends Equatable {
  const GetSpecificChatParams({required this.chatId});
  final String chatId;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"chatId": chatId};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [chatId];
}
