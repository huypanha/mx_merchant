import 'package:mx_merchant/src/models/terminal/terminal_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/terminal_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service_impl.dart';

import '../models/terminal/terminal_request_model.dart';
import '../utils/mx_merchant_exception.dart';

class MxTerminalServiceImpl implements MxTerminalService {
  late ApiService _apiService;
  String _routeV1 = 'terminal/v1/';

  @override
  late MxTerminalTransactionService transaction;

  MxTerminalServiceImpl(ApiService apiService) {
    _apiService = apiService;
    _routeV1 += 'merchantid/${_apiService.merchantId}';
    transaction = MxTerminalTransactionServiceImpl(_apiService);
  }

  @override
  Future<List<MxTerminalModel>> getListOfTerminals() async {
    final response = await _apiService.get(_routeV1, authToken: .jwt, baseUrlVersion: .v2);
    if (response.statusCode == 200) {
      return MxTerminalModel.fromJsonArray(response.data);
    } else {
      throw MxMerchantException(
        statusCode: response.statusCode ?? 500,
        message: response.data['message']?.toString() ?? 'MX Merchant API error',
        response: response.data,
      );
    }
  }

  @override
  Future<dynamic> create(MxTerminalRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/providerkey/${request.providerKey}',
      data: request.toJson(),
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
  Future<bool> delete(String terminalId) async {
    final response = await _apiService.delete('$_routeV1/terminalid/$terminalId', authToken: .jwt, baseUrlVersion: .v2);
    if (response.statusCode == 200) {
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
