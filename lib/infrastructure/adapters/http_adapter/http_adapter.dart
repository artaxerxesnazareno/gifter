import 'dart:convert';
import 'dart:developer' as developer;

import 'package:gifter/infrastructure/adapters/http_adapter/https_client.dart';
import 'package:http/http.dart' as http;

class HttpAdapter extends IHttpClient {
  @override
  Future<HttpResponse> get(String url) async {
    final response = await http.get(Uri.parse(url));
    developer.log(url, name: 'GET URL');
    developer.log(response.body, name: 'GET BODY');
    developer.log(response.statusCode.toString(), name: 'GET STATUS CODE');
    return HttpResponse(
        statusCode: response.statusCode,
        headers: response.headers,
        sucess: response.statusCode >= 200 && response.statusCode <= 299,
        object: jsonDecode(response.body));
  }

  @override
  Future<HttpResponse> post(String url, dynamic body) async {
    final response = await http.post(Uri.parse(url), body: jsonEncode(body));
    developer.log(url, name: 'POST URL');
    developer.log(body.toString(), name: 'POST PAYLOAD');
    developer.log(response.statusCode.toString(), name: 'POST STATUS CODE');
    developer.log(response.body.toString(), name: 'POST BODY');

    var decodedBody;
    if (response.body.isNotEmpty) {
      try {
        decodedBody = jsonDecode(response.body);
      } catch (e) {
        developer.log('Failed to decode response body: ${e.toString()}',
            name: 'POST ERROR');
      }
    }

    return HttpResponse(
        statusCode: response.statusCode,
        headers: response.headers,
        sucess: response.statusCode >= 200 && response.statusCode <= 299,
        object: decodedBody);
  }

  @override
  Future<HttpResponse> put(String url, dynamic body) async {
    final response = await http.put(Uri.parse(url), body: jsonEncode(body));
    developer.log(url, name: 'PUT URL');
    developer.log(body.toString(), name: 'PUT PAYLOAD');
    developer.log(response.statusCode.toString(), name: 'PUT STATUS CODE');

    var decodedBody;
    if (response.body.isNotEmpty) {
      try {
        decodedBody = jsonDecode(response.body);
      } catch (e) {
        developer.log('Failed to decode response body: ${e.toString()}',
            name: 'PUT ERROR');
      }
    }

    return HttpResponse(
        statusCode: response.statusCode,
        headers: response.headers,
        sucess: response.statusCode >= 200 && response.statusCode <= 299,
        object: decodedBody);
  }

  @override
  Future<HttpResponse> patch(String url, dynamic body) async {
    final response = await http.patch(Uri.parse(url), body: jsonEncode(body));
    developer.log(url, name: 'PATCH URL');
    developer.log(body.toString(), name: 'PATCH PAYLOAD');
    developer.log(response.statusCode.toString(), name: 'PATCH STATUS CODE');
    developer.log(response.body, name: 'PATCH RESPONSE BODY');

    var decodedBody;
    if (response.body.isNotEmpty) {
      try {
        decodedBody = jsonDecode(response.body);
      } catch (e) {
        developer.log('Failed to decode response body: ${e.toString()}',
            name: 'PATCH ERROR');
      }
    }

    return HttpResponse(
        statusCode: response.statusCode,
        headers: response.headers,
        sucess: response.statusCode >= 200 && response.statusCode <= 299,
        object: decodedBody);
  }
}
