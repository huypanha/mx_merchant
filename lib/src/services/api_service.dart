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

  String _basicToken = '';
  String? _jwtToken;

  String get _baseUrl {
    switch (env) {
      case .production:
        return 'https://api.mxmerchant.com/';
      default:
        return 'https://sandbox.api.mxmerchant.com/';
    }
  }

  String get _baseUrlV2 {
    switch (env) {
      case .production:
        return 'https://api2.mxmerchant.com/';
      default:
        return 'https://sandbox-api2.mxmerchant.com/';
    }
  }

  ApiService({required this.consumerKey, required this.consumerSecret, required this.env, required this.merchantId}) {
    final basicAuth = base64Encode(utf8.encode('$consumerKey:$consumerSecret'));
    _basicToken = 'Basic $basicAuth';
    _dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Accept': 'application/json'}))
      ..options.headers['Authorization'] = 'Basic $basicAuth';
  }

  void _setBasicToken() {
    _dio.options.headers['Authorization'] = _basicToken;
  }

  Future _setJWTToken() async {
    _jwtToken ??= await _getJWTToken();
    _jwtToken = 'Bearer ${base64Encode(utf8.encode('$consumerKey:$consumerSecret'))}';
    _dio.options.headers['Authorization'] = _jwtToken;
  }

  Future<String> _getJWTToken() async {
    _setBasicToken();
    final res = await _dio.get("$_baseUrlV2/security/v1/application/merchantId/$merchantId/token");
    final json = res.toString().replaceFirst('Response:', '').trim();
    return jsonDecode(json)['jwtToken'];
  }

  Future<T> get<T>(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    MxAuthToken authToken = .basic,
    MxBaseUrlVersion baseUrlVersion = .v1,
  }) async {
    if (authToken == .basic) {
      _setBasicToken();
    } else if (authToken == .jwt) {
      await _setJWTToken();
    }
    String baseUrl = '';
    if (baseUrlVersion == .v1) {
      baseUrl = _baseUrl;
    } else {
      baseUrl = _baseUrlV2;
    }
    final res = await _dio.get("$baseUrl$path", queryParameters: query, data: data);
    return handleResponse<T>(res);
  }

  Future<T> post<T>(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    MxAuthToken authToken = .basic,
    MxBaseUrlVersion baseUrlVersion = .v1,
  }) async {
    if (authToken == .basic) {
      _setBasicToken();
    } else if (authToken == .jwt) {
      await _setJWTToken();
    }
    String baseUrl = '';
    if (baseUrlVersion == .v1) {
      baseUrl = _baseUrl;
    } else {
      baseUrl = _baseUrlV2;
    }
    final res = await _dio.post("$baseUrl$path", queryParameters: query, data: data);
    return handleResponse<T>(res);
  }

  Future<bool> delete(
    String path, {
    Map<String, dynamic>? query,
    Map<String, dynamic>? data,
    MxAuthToken authToken = .basic,
    MxBaseUrlVersion baseUrlVersion = .v1,
  }) async {
    if (authToken == .basic) {
      _setBasicToken();
    } else if (authToken == .jwt) {
      await _setJWTToken();
    }
    String baseUrl = '';
    if (baseUrlVersion == .v1) {
      baseUrl = _baseUrl;
    } else {
      baseUrl = _baseUrlV2;
    }
    final res = await _dio.delete("$baseUrl$path", queryParameters: query, data: data);
    if (res.statusCode! < 500) {
      return true;
    }
    return false;
  }
}
