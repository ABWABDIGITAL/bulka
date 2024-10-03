import 'package:bulka/core/assets/asset_translations.dart';
import 'package:bulka/core/shared/entity/token_entity.dart';
import 'package:bulka/core/utils/constant/api_constance.dart';
import 'package:bulka/core/utils/constant/strings.dart';
import 'package:bulka/core/utils/home_utilites.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

//Todo : internet permission
// <uses-permission android:name="android.permission.INTERNET"/>

/// THIS FILE UNREQUIRED TO USE
/// BUT ATLEAST DOING WHAT YOU NEED WITH THE LOWEST COMPLEXITY TO UNDERSTAND

class DioHelper extends Equatable {
  const DioHelper._();
  static late Dio _dio;

  static init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstance.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Accept': 'application/json',
          "Access-Control-Allow-Origin": "*",
          // 'Accept-Language':
          //     AssetTranslations.getLanguage().locale.languageCode,
          // "Authorization": "Bearer ${getToken()}",
        },
        contentType: 'application/json',
      ),
    );
    addDioInterceptor();
  }

  static void addDioInterceptor() {
    _dio.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }

  static Future<Map<String, dynamic>> _getHeaders() async {
    TokenEntity? token = await getToken();
    LanguageConfig lang = await AssetTranslations.getLanguage();
    return {
      'Accept': 'application/json',
      "Access-Control-Allow-Origin": "*",
      'Accept-Language': lang.locale.languageCode,
      "Authorization": token != null ? "Bearer ${token.token}" : '',
    };
  }

  static Future<Response> get(
    final String url, {
    final Map<String, dynamic>? queries,
    final Map<String, dynamic>? data,
    final String? token,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.get(
      url,
      queryParameters: queries,
      data: data,
    );
  }

  static Future<Response> post(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, dynamic>? queryParameters,
    final String? token,
    final bool isFormData = false,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.post(
      url,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> put(
    String url, {
    final Map<String, dynamic>? queryParameters,
    final Map<String, dynamic>? data,
    final String? token,
    final bool isFormData = false,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.put(
      url,
      data: isFormData ? FormData.fromMap(data ?? {}) : data,
      queryParameters: queryParameters,
    );
  }

  static Future<Response> delet(
    final String url, {
    final Map<String, dynamic>? data,
    final Map<String, dynamic>? query,
    final String? token,
  }) async {
    _dio.options.headers = await _getHeaders();
    return await _dio.delete(
      url,
      data: data ?? {},
      queryParameters: query ?? {},
    );
  }

  @override
  List<Object?> get props => [_dio];
}
