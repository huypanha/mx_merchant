import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mx_merchant/src/utils/handle_response.dart';

import '../utils/enums.dart';

class ApiService {
  late Dio _dio;
  String consumerKey;
  String consumerSecret;
  String merchantId;
  MxMerchantEnvironment env;

  String get _baseUrl {
    switch (env) {
      case .production:
        return 'https://api.mxmerchant.com/checkout/v3/';
      default:
        return 'https://sandbox.api.mxmerchant.com/checkout/v3/';
    }
  }

  ApiService({required this.consumerKey, required this.consumerSecret, required this.env, required this.merchantId}) {
    final basicAuth = base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
    _dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}))
      ..options.headers['Authorization'] = 'Basic $basicAuth';
  }

  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query, Map<String, dynamic>? data}) async {
    final res = await _dio.get("$_baseUrl$path", queryParameters: query, data: data);
    return handleResponse(res);
  }

  Future<Map<String, dynamic>> post(String path, {Map<String, dynamic>? query, Map<String, dynamic>? data}) async {
    final res = await _dio.post("$_baseUrl$path", queryParameters: query, data: data);
    return handleResponse(res);
  }

  Future<bool> delete(String path, {Map<String, dynamic>? query, Map<String, dynamic>? data}) async {
    final res = await _dio.delete("$_baseUrl$path", queryParameters: query, data: data);
    if (res.statusCode! < 500) {
      return true;
    }
    return false;
  }
}
