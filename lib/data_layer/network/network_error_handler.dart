import 'package:dio/dio.dart';
import 'package:tut_app/data_layer/network/failure.dart';
class ErrorHandler implements Exception{
  late Failure failureObject;
  ErrorHandler.handle(dynamic error){
    if (error is DioException){
      // dio error so it's an error response of the API or from dio itself
      failureObject = _handelError(error);
    }else{
      // default error
      failureObject = ResponseStatus.defaultError.getFailure();
    }
  }
  Failure _handelError(DioException error) {
    switch(error.type){
      case DioExceptionType.connectionTimeout:
         return ResponseStatus.connectTimeout.getFailure();
      case DioExceptionType.sendTimeout:
         return ResponseStatus.sendTimeout.getFailure();
      case DioExceptionType.receiveTimeout:
          return ResponseStatus.receiveTimeout.getFailure();
      case DioExceptionType.cancel:
          return ResponseStatus.cancel.getFailure();
      default:
          return ResponseStatus.defaultError.getFailure();
    }
  }
}

extension ResponseStatusExtension on ResponseStatus{
  Failure getFailure(){
    switch (this){
      case ResponseStatus.success:
        return Failure(ResponsesStatusCode.success, ResponsesStatusMessage.success);
      case ResponseStatus.noContent:
        return Failure(ResponsesStatusCode.noContent, ResponsesStatusMessage.noContent);
      case ResponseStatus.badRequest:
        return Failure(ResponsesStatusCode.badRequest, ResponsesStatusMessage.badRequest);
      case ResponseStatus.forbidden:
        return Failure(ResponsesStatusCode.forbidden, ResponsesStatusMessage.forbidden);
      case ResponseStatus.unauthorized:
        return Failure(ResponsesStatusCode.unauthorized, ResponsesStatusMessage.unauthorized);
      case ResponseStatus.notFounded:
        return Failure(ResponsesStatusCode.notFounded, ResponsesStatusMessage.notFounded);
      case ResponseStatus.internalServerError:
        return Failure(ResponsesStatusCode.internalServerError, ResponsesStatusMessage.internalServerError);
      case ResponseStatus.connectTimeout:
        return Failure(ResponsesStatusCode.connectTimeout, ResponsesStatusMessage.connectTimeout);
      case ResponseStatus.cancel:
        return Failure(ResponsesStatusCode.cancel, ResponsesStatusMessage.cancel);
      case ResponseStatus.receiveTimeout:
        return Failure(ResponsesStatusCode.receiveTimeout, ResponsesStatusMessage.receiveTimeout);
      case ResponseStatus.sendTimeout:
        return Failure(ResponsesStatusCode.sendTimeout, ResponsesStatusMessage.sendTimeout);
      case ResponseStatus.cacheError:
        return Failure(ResponsesStatusCode.cacheError, ResponsesStatusMessage.cacheError);
      case ResponseStatus.noInternetConnection:
        return Failure(ResponsesStatusCode.noInternetConnection, ResponsesStatusMessage.noInternetConnection);
      case ResponseStatus.defaultError:
        return Failure(ResponsesStatusCode.defaultError, ResponsesStatusMessage.defaultError);
    }
  }
}
enum ResponseStatus{
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFounded,
  internalServerError,
  connectTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
   defaultError
}
class ResponsesStatusCode{
  static const int success = 200;
  static const int noContent = 201;
  static const int badRequest = 400;
  static const int unauthorized = 401;
  static const int forbidden = 403;
  static const int notFounded = 404;
  static const int internalServerError = 500;
  // local network problems
  static const int noInternetConnection = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int defaultError = -7;
}
class ResponsesStatusMessage{
  static const String success = "come successfully";
  static const String noContent = "call done successfully, but no data content!";
  static const String badRequest = "Bad request, try again later";
  static const String unauthorized = "unauthorized, try again later";
  static const String forbidden = "Forbidden, try again later";
  static const String notFounded = "URL Not Founded, try again later";
  static const String internalServerError = "Something went wrong, try again later";
  static const String defaultError = "Something went wrong, try again later";
  // local network problems
  static const String noInternetConnection = "You are offline, check your connection and try again";
  static const String connectTimeout = "connectTimeout, check your connection and try again";
  static const String cancel = "request cancelled, check your connection and try again";
  static const String receiveTimeout = "receive timeout , check your connection and try again";
  static const String sendTimeout = "send timeout, check your connection and try again";
  static const String cacheError = "cache error, check your connection and try again";
}
class ApiInternalStatus{
  static const int   success = 0;
  static const int fail = 1;
}