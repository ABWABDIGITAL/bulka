import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';

class InvalidJsonException implements Exception {
  final ApiErrorEntity error;
  InvalidJsonException(this.error);

  @override
  String toString() => 'InvalidJsonException: ${error.message}';
}

T parseJsonField<T>(Map<String, dynamic> json, String fieldName) {
  final value = json[fieldName];

  if (value is T) {
    return value;
  }

  throw InvalidJsonException(ApiErrorEntity(
    status: false,
    code: ResponseCode.jsonValidationError,
    message: 'Field $fieldName is not of type $T',
    errors: [
      'Field $fieldName is not of type $T',
    ],
  ));
}
