import 'package:equatable/equatable.dart';

class VeriftAccountParams extends Equatable {
  const VeriftAccountParams({required this.code});
  final String code;

  Map<String, dynamic> returnedMap() {
    Map<String, dynamic> map = {"code": code};
    map.removeWhere((key, value) => value == null);
    return map;
  }

  @override
  List<Object?> get props => [code];
}
