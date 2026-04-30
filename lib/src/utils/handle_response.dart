import 'package:dio/dio.dart';

import 'mx_merchant_exception.dart';

T handleResponse<T>(Response response) {
  if ((response.statusCode ?? 500) >= 200 && (response.statusCode ?? 500) < 300) {
    return response.data;
  }

  throw MxMerchantException(
    statusCode: response.statusCode ?? 500,
    message: response.data['message']?.toString() ?? 'MX Merchant API error',
    response: response.data,
  );
}
