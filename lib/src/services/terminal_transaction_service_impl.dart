import 'package:mx_merchant/src/models/terminal/transaction/update_transaction_request_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service.dart';

import '../models/terminal/transaction/create_transaction_request_model.dart';
import '../models/terminal/transaction/create_transaction_response_model.dart';
import '../utils/mx_merchant_exception.dart';

class MxTerminalTransactionServiceImpl implements MxTerminalTransactionService {
  late ApiService _apiService;
  final String _routeV1 = 'terminal/v1/transaction';

  MxTerminalTransactionServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<MxTerminalCreateTransactionResponseModel> create(MxTerminalCreateTransactionRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/merchantid/${_apiService.merchantId}/terminalid/${request.terminalId}',
      authToken: .jwt,
      baseUrlVersion: .v2,
      data: request.toJson(),
    );
    if (response.statusCode == 200) {
      return MxTerminalCreateTransactionResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<dynamic> update(MxTerminalUpdateTransactionRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/callback/merchantid/${_apiService.merchantId}/reference/${request.reference}/terminalid/${request.terminalId}/transactionId/${request.transactionId}',
      authToken: .jwt,
      baseUrlVersion: .v2,
    );
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<dynamic> get(String replayId) async {
    final response = await _apiService.get('checkout/v3/payment', query: {'merchantId': _apiService.merchantId, 'replayId': replayId});
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<bool> delete(String terminalId) async {
    final response = await _apiService.get('$_routeV1/merchantid/${_apiService.merchantId}/terminalid/$terminalId');
    if (response.statusCode == 204) {
      return true;
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }
}
