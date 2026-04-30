import 'dart:convert';

import 'package:dio/dio.dart';

import 'mxmerchant_exception.dart';

Map<String, dynamic> handleResponse(Response response) {
  final body = response.data == null || (response.data != null && response.data.isEmpty)
      ? Map<String, dynamic>.from({})
      : Map<String, dynamic>.from(jsonDecode(response.data));

  if ((response.statusCode ?? 500) >= 200 && (response.statusCode ?? 500) < 300) {
    return body;
  }

  throw MxMerchantException(statusCode: response.statusCode ?? 500, message: body['message']?.toString() ?? 'MX Merchant API error', response: body);
}
