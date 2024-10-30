import 'package:gifter/domain/exceptions/message_exception.dart';
import 'package:gifter/domain/exceptions/server_exception.dart';

abstract class IHttpClient {
  Future<HttpResponse> get(String url);

  Future<HttpResponse> post(String url, dynamic body);

  Future<HttpResponse> put(String url, dynamic body);

  Future<HttpResponse> patch(String url, dynamic body);
}

class HttpResponse {
  final int statusCode;
  final Map<String, String> headers;
  final dynamic object;
  final bool sucess;

  HttpResponse({
    required this.statusCode,
    required this.headers,
    required this.sucess,
    this.object,
  });

  void handleHttpResponse() {
    if (statusCode >= 500 && statusCode <= 599) {
      throw ServerException();
    } else {
      throw MessageException(object is Map && object['detail'] != null
          ? object['detail']
          : 'Ocorreu um erro inesperado.');
    }
  }
}
