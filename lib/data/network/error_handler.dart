import 'package:complete_advance_flutter/data/network/failure.dart';
import 'package:dio/dio.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorised,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  recieveTimeout,
  sendTimeOut,
  cacheError,
  noInternetConnection,
  DEFAULT,
}

class ErrorHandler implements Exception {
  late Failure failure;

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      // dio error so its error from response of the API
      failure = _handleError(error);
    } else {
      // default error

      failure = DataSource.DEFAULT.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeOut.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.recieveTimeout.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.badRequest.getFailure();
      case DioErrorType.badResponse:
        switch (error.response!.statusCode) {
          case ReponseCode.badRequest:
            return DataSource.badRequest.getFailure();
          case ReponseCode.forbidden:
            return DataSource.forbidden.getFailure();
          case ReponseCode.unauthorised:
            return DataSource.unauthorised.getFailure();
          case ReponseCode.notFound:
            return DataSource.notFound.getFailure();
          case ReponseCode.internalServerError:
            return DataSource.internalServerError.getFailure();
          default:
            return DataSource.DEFAULT.getFailure();
        }
        break;
      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.connectionError:
        return DataSource.connectTimeout.getFailure();
      case DioErrorType.unknown:
        return DataSource.DEFAULT.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.badRequest:
        return Failure(ReponseCode.badRequest, ReponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(ReponseCode.forbidden, ReponseMessage.forbidden);
      case DataSource.unauthorised:
        return Failure(ReponseCode.unauthorised, ReponseMessage.unauthorised);
      case DataSource.notFound:
        return Failure(ReponseCode.notFound, ReponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(ReponseCode.internalServerError,
            ReponseMessage.internalServerError);
      case DataSource.connectTimeout:
        return Failure(
            ReponseCode.connectTimeout, ReponseMessage.connectTimeOut);
      case DataSource.cancel:
        return Failure(ReponseCode.cancel, ReponseMessage.cancel);
      case DataSource.recieveTimeout:
        return Failure(
            ReponseCode.recieveTimeout, ReponseMessage.recieveTimeOut);
      case DataSource.cacheError:
        return Failure(ReponseCode.cacheError, ReponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(ReponseCode.noInternetConnection,
            ReponseMessage.noInternetConnection);
      case DataSource.DEFAULT:
        return Failure(ReponseCode.DEFAULT, ReponseMessage.DEFAULT);
      default:
        return Failure(ReponseCode.DEFAULT, ReponseMessage.DEFAULT);
    }
  }
}

class ReponseCode {
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int forbidden = 403;
  static const int unauthorised = 401;
  static const int notFound = 404;
  static const int internalServerError = 500;

  // local status code
  static const int DEFAULT = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int recieveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ReponseMessage {
  static const String success = "success";
  static const String noContent = "No content with no content";
  static const String badRequest = "Bad request,try again later";
  static const String forbidden = "forbidden request,try again later";
  static const String unauthorised = "user is unauthorised,try again later";
  static const String notFound = "Url is not found,try again later";
  static const String internalServerError =
      "Some thing went wrong,try agian later";

  // local status code
  static const String DEFAULT = "some thing went wrong, try again later";
  static const String connectTimeOut = "timeout error, try again later";
  static const String cancel = "request was cancelled, try again later";
  static const String recieveTimeOut = "time out error, try again later";
  static const String sendTimeOut = "time out error, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
}
