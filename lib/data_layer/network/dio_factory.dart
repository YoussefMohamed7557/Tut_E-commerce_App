import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tut_app/application_layer/constants.dart';
import 'package:tut_app/presentation_layer/resources/language_manager.dart';



class DioFactory{
  final String _applicationJson = "application/json";
  final String _contentType = "content-type";
  final String _accept = "accept";
  final String _authorization = "authorization";
  final String _defaultLanguage = "language";

  Future<Dio> getDio()async{
    Dio dio = Dio();
    Map<String,String> headers = {
      _contentType :_applicationJson,
      _accept : _applicationJson,
      _authorization : Constants.token,
      _defaultLanguage : LanguageType.english.getValue()
    };
    dio.options = BaseOptions(
      baseUrl: Constants.baseUrl,
      headers: headers,
      receiveTimeout: Duration(milliseconds:Constants.timeOut ),
      sendTimeout:  Duration(milliseconds: Constants.timeOut),
    );
    if(!kReleaseMode){
      dio.interceptors.add(PrettyDioLogger(
        requestHeader : true,
        requestBody : true,
        responseHeader : true,)
      );
    }
    return dio;
  }
}