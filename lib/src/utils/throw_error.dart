import 'package:dio/dio.dart';

import 'mx_merchant_exception.dart';

MxMerchantException errorParser(Response response) {
  String message = 'MX Merchant API error';
  if (response.data is Map) {
    if (Map.from(response.data).containsKey('details')) {
      message = Map.from(response.data)['details']?.toString() ?? 'MX Merchant API error';
    } else if (Map.from(response.data).containsKey('message')) {
      message = Map.from(response.data)['message']?.toString() ?? 'MX Merchant API error';
    } else if (Map.from(response.data).containsKey('Message')) {
      message = Map.from(response.data)['Message']?.toString() ?? 'MX Merchant API error';
    }
  }
  return MxMerchantException(statusCode: response.statusCode ?? 500, message: message, response: response.data);
}
