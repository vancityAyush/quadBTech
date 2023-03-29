import 'package:dio/dio.dart';

import '../../app/data/models/response/error_response.dart';
import '../values/constants.dart';
import 'app_toast.dart';

class APIException implements Exception {
  final String? message;
  final int? statusCode;

  APIException({required this.message, required this.statusCode});
}

class ExceptionHandler {
  ExceptionHandler._privateConstructor();

  static String _checkOtherErrors(DioError error) {
    if (error.message.contains('Socket')) {
      return ErrorMessages.noInternet;
    } else {
      return ErrorMessages.networkGeneral;
    }
  }

  static APIException handleError(Exception error) {
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.sendTimeout:
          return APIException(
              message: ErrorMessages.noInternet,
              statusCode: error.response?.statusCode);
        case DioErrorType.connectTimeout:
          return APIException(
              message: ErrorMessages.connectionTimeout,
              statusCode: error.response?.statusCode);
        case DioErrorType.response:
          return APIException(
              message: ErrorResponse.fromJson(error.response?.data).message,
              statusCode: error.response?.statusCode);
        case DioErrorType.other:
          return APIException(
              message: _checkOtherErrors(error),
              statusCode: error.response?.statusCode);
        default:
          return APIException(
              message: ErrorMessages.networkGeneral,
              statusCode: error.response?.statusCode);
      }
    } else {
      return APIException(
          message: ErrorMessages.networkGeneral, statusCode: 500);
    }
  }
}

class HandleError {
  HandleError._privateConstructor();

  static handleError(APIException? error) {
    AppToast.showToast(error?.message ?? ErrorMessages.networkGeneral);
  }
}
