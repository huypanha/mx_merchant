import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import '../utils/enums.dart';

class ApiService {
  late Dio _dio;
  String consumerKey;
  String consumerSecret;
  String merchantId;
  MxMerchantEnvironmentEnum env;

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
      ..options.headers['Authorization'] = 'Basic $basicAuth'
      ..options.validateStatus = (s) => true;
  }

  void _setBasicToken() {
    _dio.options.headers['Authorization'] = _basicToken;
    log('Token = "$_basicToken"');
  }

  Future _setJWTToken() async {
    _jwtToken ??= await _getJWTToken();
    _dio.options.headers['Authorization'] = _jwtToken;
    log('JWT Token = "$_jwtToken"');
  }

  Future<String> _getJWTToken() async {
    _setBasicToken();
    final res = await _dio.get("${_baseUrlV2}security/v1/application/merchantId/$merchantId/token");
    return "Bearer ${jsonDecode(res.data)['jwtToken']}";
  }

  Future<Response> get(
    String path, {
    Map<String, dynamic>? query,
    Object? data,
    MxAuthTokenEnum authToken = .basic,
    MxBaseUrlVersionEnum baseUrlVersion = .v1,
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
    return await _dio.get("$baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> post(
    String path, {
    Map<String, dynamic>? query,
    Object? data,
    MxAuthTokenEnum authToken = .basic,
    MxBaseUrlVersionEnum baseUrlVersion = .v1,
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
    return await _dio.post("$baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> delete(
    String path, {
    Map<String, dynamic>? query,
    Object? data,
    MxAuthTokenEnum authToken = .basic,
    MxBaseUrlVersionEnum baseUrlVersion = .v1,
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
    return await _dio.delete("$baseUrl$path", queryParameters: query, data: data);
  }

  Future<Response> put(
    String path, {
    Map<String, dynamic>? query,
    Object? data,
    MxAuthTokenEnum authToken = .basic,
    MxBaseUrlVersionEnum baseUrlVersion = .v1,
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
    return await _dio.put("$baseUrl$path", queryParameters: query, data: data);
  }
}
