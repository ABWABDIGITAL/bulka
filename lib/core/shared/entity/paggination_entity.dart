import 'package:equatable/equatable.dart';

class PagginationEntity extends Equatable {
  const PagginationEntity({
    required this.currentPage,
    required this.lastPage,
    required this.perPage,
  });
  final int currentPage;
  final int lastPage;
  final int perPage;

  @override
  List<Object?> get props => [currentPage, lastPage, perPage];
}
