import 'package:bulka/core/services/api_handler/api_error_messages.dart';
import 'package:bulka/core/services/api_handler/api_response_code.dart';
import 'package:bulka/core/services/api_handler/api_status_enum.dart';
import 'package:bulka/core/shared/entity/api_error_entity.dart';
import 'package:bulka/core/shared/models/api_error_model.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';

///  THIS FILE NEED TO REFACTOR BUT ATLEAST STILL WORKING :)

class ApiResponse extends Equatable {
  final Response<dynamic> value;
  const ApiResponse(this.value);
  ApiStatusEnum get status {
    if (value.statusCode == ResponseCode.success) {
      return ApiStatusEnum.success;
    }
    if (value.statusCode == ResponseCode.created) {
      return ApiStatusEnum.created;
    }
    if (value.statusCode == ResponseCode.badRequest) {
      return ApiStatusEnum.badRequest;
    }
    if (value.statusCode == ResponseCode.unAuthorized) {
      return ApiStatusEnum.unauthorized;
    }
    if (value.statusCode == ResponseCode.forbidden) {
      return ApiStatusEnum.forbidden;
    }
    if (value.statusCode == ResponseCode.notFound) {
      return ApiStatusEnum.notFound;
    }
    if (value.statusCode == ResponseCode.internalServerError) {
      return ApiStatusEnum.internalServerError;
    }
    if (value.statusCode == ResponseCode.jsonValidationError) {
      return ApiStatusEnum.jsonValidationError;
    }
    if (value.statusCode == ResponseCode.badGatway) {
      return ApiStatusEnum.badGateway;
    } else {
      return ApiStatusEnum.unknown;
    }
  }

  @override
  List<Object?> get props => [value];
}

ApiStatusEnum statusEnum(Response<dynamic> value) {
  return ApiResponse(value).status;
}

class ErrorHandler implements Exception {
  static ApiErrorEntity handleError(dynamic response) {
    if (response is DioException) {
      if (checkFromMap(response.response?.data)) {
        return ApiErrorModel.fromJson(
          response.response?.data,
          response.response?.statusCode ?? 1000,
        );
      } else if (response.type == DioExceptionType.connectionError) {
        return ApiErrorModel(
          status: ApiInternalStatus.faliure,
          code: ResponseCode.connectionError,
          message: ApiErrorMessages.connectionerror.tr(),
          errors: [
            '* ${ApiErrorMessages.maybeerrorinserver.tr()}',
            '* ${ApiErrorMessages.maybeinternetconnectionislost.tr()}',
          ],
        );
      } else {
        return const ApiErrorModel(
          status: ApiInternalStatus.faliure,
          code: ResponseCode.unknown,
          message: 'unknown error',
          errors: [],
        );
      }
    } else if (response is TypeError) {
      return ApiErrorModel(
        status: ApiInternalStatus.faliure,
        code: ResponseCode.unknown,
        message: 'something changed in returned data',
        errors: [(response.toString())],
      );
    } else {
      return const ApiErrorModel(
        status: ApiInternalStatus.faliure,
        code: ResponseCode.unknown,
        message: 'unknown error',
        errors: [],
      );
    }
  }
}

class ApiInternalStatus {
  static const bool success = true;
  static const bool faliure = false;
}
