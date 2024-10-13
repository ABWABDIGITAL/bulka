import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  final String keyword;
  final int page;
  const SearchParams({
    required this.keyword,
    required this.page,
  });

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {
      "key_word": keyword,
      "page": page,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [keyword];
}
