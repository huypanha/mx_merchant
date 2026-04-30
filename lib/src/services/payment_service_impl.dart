import 'package:mx_merchant/src/models/payment/get_payment_request_model.dart';
import 'package:mx_merchant/src/models/payment/get_payment_response_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/payment_service.dart';

import '../models/payment/get_a_payment_response_model.dart';
import '../models/payment/payment_request_model.dart';
import '../models/payment/payment_response_model.dart';

class MxPaymentServiceImpl implements MxPaymentService {
  late ApiService _apiService;
  final String _route = 'payments';

  MxPaymentServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<MxPaymentResponseModel> makePayment(MxPaymentRequestModel payment) async {
    final data = payment.toBodyJson();
    data['merchantId'] = _apiService.merchantId;
    final response = await _apiService.post(_route, data: data, query: payment.toQueryJson());
    return MxPaymentResponseModel.fromJson(response);
  }

  @override
  Future<MxGetPaymentResponseModel> getPayments(MxGetPaymentRequestModel request) async {
    final data = request.toJson();
    data['merchantId'] = int.tryParse(_apiService.merchantId) ?? 0;
    final response = await _apiService.get(_route, query: data);
    return MxGetPaymentResponseModel.fromJson(response);
  }

  @override
  Future<MxGetAPaymentResponseModel> getAPayment(String paymentId, {bool includeCustomer = true}) async {
    final response = await _apiService.get("$_route/$paymentId", query: {'includeCustomer': includeCustomer});
    return MxGetAPaymentResponseModel.fromJson(response);
  }

  @override
  Future<bool> voidAPayment(String paymentId, {bool? force}) async {
    final response = await _apiService.delete("$_route/$paymentId", query: {'force': force}..removeWhere((_, v) => v == null));
    return response;
  }

  @override
  Future<bool> sendAPaymentReceipt({required String paymentId, required String contact, bool? ignoreBcc}) async {
    await _apiService.post(_route, query: {'id': paymentId, 'contact': contact, 'ignoreBcc': ignoreBcc}..removeWhere((_, v) => v == null));
    return true;
  }
}
