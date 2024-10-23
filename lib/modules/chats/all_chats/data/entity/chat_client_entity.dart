import 'package:bulka/core/utils/enums/enums.dart';
import 'package:equatable/equatable.dart';

class ChatClientEntity extends Equatable {
  const ChatClientEntity({
    required this.id,
    required this.name,
    required this.role,
    this.avatar,
  });
  final int id;
  final String name;
  final String? avatar;
  final ChatClientSideRole role;

  @override
  List<Object?> get props => [id, name, avatar, role];
}
