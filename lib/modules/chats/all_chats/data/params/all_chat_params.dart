import 'package:equatable/equatable.dart';

class AllChatParams extends Equatable {
  const AllChatParams({this.keyword});
  final String? keyword;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"key_word": keyword};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [keyword];
}
