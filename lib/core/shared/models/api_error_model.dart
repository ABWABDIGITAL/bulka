import 'package:bulka/core/services/api_handler/api_error_handler.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/utils/home_utilites.dart';

class ApiErrorModel extends ApiErrorEntity {
  const ApiErrorModel({
    required super.status,
    required super.code,
    required super.message,
    required super.errors,
  });

  factory ApiErrorModel.fromJson(Map<String, dynamic> json, {int? statusCode}) {
    return ApiErrorModel(
      status: json['status'] ?? ApiInternalStatus.faliure,
      code: statusCode ?? json['code'] ?? -1000,
      message: json['message'] ?? "Invalid",
      errors: checkFromArray(json['errors'])
          ? List<String>.from(json['errors'])
          : [json['message'] ?? "Invalid"],
    );
  }
}
