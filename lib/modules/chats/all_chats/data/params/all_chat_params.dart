import 'package:equatable/equatable.dart';

class AllChatParams extends Equatable {
  const AllChatParams({
    this.keyword,
    this.type,
    required this.page,
  });
  final String? keyword;
  final int page;
  final String? type;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "key_word": keyword,
      "type": type,
      "page": page,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [keyword, type, page];
}
