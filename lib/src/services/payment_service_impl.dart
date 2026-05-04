import 'dart:developer';

import 'package:mx_merchant/src/models/payment/get_payment_request_model.dart';
import 'package:mx_merchant/src/models/payment/get_payment_response_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/payment_service.dart';
import 'package:mx_merchant/src/utils/throw_error.dart';

import '../models/payment/get_a_payment_response_model.dart';
import '../models/payment/payment_request_model.dart';
import '../models/payment/payment_response_model.dart';

class MxPaymentServiceImpl implements MxPaymentService {
  late ApiService _apiService;
  final String _route = 'checkout/v3/payment';

  MxPaymentServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<MxPaymentResponseModel> makePayment(MxPaymentRequestModel payment) async {
    final data = payment.toBodyJson();
    data['merchantId'] = _apiService.merchantId;
    final response = await _apiService.post(_route, data: data, query: payment.toQueryJson());
    if (response.statusCode == 201) {
      return MxPaymentResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      log('Error: ${response.data}');
      throw errorParser(response);
    }
  }

  @override
  Future<MxGetPaymentResponseModel> getPayments(MxGetPaymentRequestModel request) async {
    final data = request.toJson();
    data['merchantId'] = int.tryParse(_apiService.merchantId) ?? 0;
    final response = await _apiService.get(_route, query: data);
    if (response.statusCode == 200) {
      return MxGetPaymentResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxGetAPaymentResponseModel> getAPayment(String paymentId, {bool includeCustomer = true}) async {
    final response = await _apiService.get("$_route/$paymentId", query: {'includeCustomer': includeCustomer});
    if (response.statusCode == 200) {
      return MxGetAPaymentResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<bool> voidAPayment(String paymentId, {bool? force}) async {
    final response = await _apiService.delete("$_route/$paymentId", query: {'force': force}..removeWhere((_, v) => v == null));
    if (response.statusCode == 204) {
      log('voidAPayment res = ${response.data}');
      return true;
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<bool> sendAPaymentReceipt({required String paymentId, required String contact, bool? ignoreBcc}) async {
    final response = await _apiService.post(
      'checkout/v3/paymentreceipt',
      query: {'id': paymentId, 'contact': contact, 'ignoreBcc': ignoreBcc}..removeWhere((_, v) => v == null),
    );
    if (response.statusCode == 202) {
      log('sendAPaymentReceipt res = ${response.data}');
      return true;
    } else {
      throw errorParser(response);
    }
  }
}
