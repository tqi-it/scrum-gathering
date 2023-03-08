import 'dart:io';
import 'package:dio/native_imp.dart';
import 'package:dio/src/adapter.dart';
import 'package:dio_logger/dio_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:mentorme/app/shared/data/api_constants.dart';
import 'package:mentorme/app/shared/services/interceptors/info_interceptors.dart';
import 'package:dio/adapter.dart';

class HttpService extends DioForNative implements IHttpService {

  HttpService() {
    options.headers.addAll({HttpHeaders.contentTypeHeader: 'application/json'});
    options.setRequestContentTypeWhenNoPayload = true;
    setUpInterceptors();
  }

  @override
  void setEnviroment(String env) async {
    const baseUrl = ApiConstants.baseUrl;
    const complement = ApiConstants.complement;
    const environment = ApiConstants.qaEnv;

    options.baseUrl = 'https://private-97460f-mentorme.apiary-mock.com';//'$env$environment$baseUrl$complement';
    //print('$env$environment$baseUrl$complement');
  }

  @override
  void setUpInterceptors() {
    interceptors.add(InfoInterceptors());
    interceptors.add(dioLoggerInterceptor);
  }

  @override
  void setAuthorization(String token) {
    options.headers.addAll({HttpHeaders.authorizationHeader: 'Bearer $token'});
  }

  @override
  void removeAuthorization() {
    options.headers.remove(HttpHeaders.authorizationHeader);
  }

  @override
  void setTimeOut() {
    options.receiveTimeout = 1 * 1000;
  }

  @override
  void disableCertificates(httpService) {
    //ATTENTION: DO NOT USE IN PRODUCTION
    (httpService.httpClientAdapter as DefaultHttpClientAdapter)
        .onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }
}

abstract class IHttpService extends DioForNative {
  void disableCertificates(IHttpService httpService);

  void setUpInterceptors();

  void setEnviroment(String env);

  void setAuthorization(String token);

  void removeAuthorization();

  void setTimeOut();
}
