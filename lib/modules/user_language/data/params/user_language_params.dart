import 'package:equatable/equatable.dart';

class UserLanguageParams extends Equatable {
  final int levelId;
  final int langId;

  const UserLanguageParams({required this.levelId, required this.langId});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {'language_id': langId, 'level_id': levelId};
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
