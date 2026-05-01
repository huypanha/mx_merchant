import 'package:mx_merchant/src/models/terminal/transaction/update_transaction_request_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service.dart';

import '../models/terminal/transaction/create_transaction_request_model.dart';
import '../models/terminal/transaction/create_transaction_response_model.dart';

class MxTerminalTransactionServiceImpl implements MxTerminalTransactionService {
  late ApiService _apiService;
  final String _routeV1 = 'terminal/v1/transaction';

  MxTerminalTransactionServiceImpl(ApiService apiService) {
    _apiService = apiService;
  }

  @override
  Future<MxTerminalCreateTransactionResponseModel> createTransaction(MxTerminalCreateTransactionRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/merchantid/${_apiService.merchantId}/terminalid/${request.terminalId}',
      authToken: .jwt,
      baseUrlVersion: .v2,
      data: request.toJson(),
    );
    return MxTerminalCreateTransactionResponseModel.fromJson(Map<String, dynamic>.from(response));
  }

  @override
  Future<dynamic> updateTransaction(MxTerminalUpdateTransactionRequestModel request) async {
    await _apiService.post(
      '$_routeV1/callback/merchantid/${_apiService.merchantId}/reference/${request.reference}/terminalid/${request.terminalId}/transactionId/${request.transactionId}',
      authToken: .jwt,
      baseUrlVersion: .v2,
    );
  }

  @override
  Future<dynamic> getTransaction(String replayId) async {
    await _apiService.get('checkout/v3/payment', query: {'merchantId': _apiService.merchantId, 'replayId': replayId});
  }

  @override
  Future<bool> deleteTransaction(String terminalId) async {
    return await _apiService.get('$_routeV1/merchantid/${_apiService.merchantId}/terminalid/$terminalId');
  }
}
