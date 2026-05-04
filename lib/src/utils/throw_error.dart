import 'package:dio/dio.dart';

import 'mx_merchant_exception.dart';

MxMerchantException errorParser(Response response) {
  return MxMerchantException(
    statusCode: response.statusCode ?? 500,
    message: response.data['details']?.toString() ?? 'MX Merchant API error',
    response: response.data,
  );
}
