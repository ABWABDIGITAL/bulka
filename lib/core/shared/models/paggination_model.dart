import 'package:bulka/core/shared/entity/paggination_entity.dart';

class PagginationModel extends PagginationEntity {
  const PagginationModel({
    required super.currentPage,
    required super.lastPage,
    required super.perPage,
  });

  factory PagginationModel.fromJson(Map<String, dynamic> json) {
    return PagginationModel(
      currentPage: json['current_page'],
      lastPage: json['last_page'],
      perPage: json['per_page'],
    );
  }
}
