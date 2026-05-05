import 'dart:convert';
import 'dart:developer';

import 'package:mx_merchant/mx_merchant.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service.dart';

import '../utils/throw_error.dart';

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
    log('MxTerminalTransactionServiceImpl.create = ${jsonEncode(response.data)}');
    if (response.statusCode == 200) {
      return MxTerminalCreateTransactionResponseModel.fromJson(Map<String, dynamic>.from(response.data));
    } else {
      if (response.data.runtimeType == String) {
        response.data = {'message': response.data};
      }
      throw errorParser(response);
    }
  }

  @override
  Future<dynamic> update(MxTerminalUpdateTransactionRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/callback/merchantid/${_apiService.merchantId}/reference/${request.reference}/terminalid/${request.terminalId}/transactionId/${request.transactionId}',
      authToken: .jwt,
      baseUrlVersion: .v2,
    );
    log('MxTerminalTransactionServiceImpl.update = ${response.data}');
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<MxPaymentResponseModel> get(String replayId) async {
    final response = await _apiService.get('checkout/v3/payment', query: {'merchantId': _apiService.merchantId, 'replayId': replayId});
    log('MxTerminalTransactionServiceImpl.get = ${response.data}');
    if (response.statusCode == 200) {
      return MxPaymentResponseModel.fromJson(response.data);
    } else {
      throw errorParser(response);
    }
  }

  @override
  Future<bool> deleteQueued(String terminalId) async {
    final response = await _apiService.get('$_routeV1/merchantid/${_apiService.merchantId}/terminalid/$terminalId');
    log('MxTerminalTransactionServiceImpl.delete = ${response.data}');
    if (response.statusCode == 204) {
      return true;
    } else {
      throw errorParser(response);
    }
  }
}
