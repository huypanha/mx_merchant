import 'package:mx_merchant/src/models/terminal/terminal_model.dart';
import 'package:mx_merchant/src/services/api_service.dart';
import 'package:mx_merchant/src/services/terminal_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service.dart';
import 'package:mx_merchant/src/services/terminal_transaction_service_impl.dart';
import 'package:mx_merchant/src/utils/handle_response.dart';

import '../models/terminal/terminal_request_model.dart';

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
    final response = await _apiService.get<List>(_routeV1, authToken: .jwt, baseUrlVersion: .v2);
    return MxTerminalModel.fromJsonArray(response);
  }

  @override
  Future<dynamic> createTerminal(MxTerminalRequestModel request) async {
    final response = await _apiService.post(
      '$_routeV1/providerkey/${request.providerKey}',
      data: request.toJson(),
      authToken: .jwt,
      baseUrlVersion: .v2,
    );
    return handleResponse(response);
  }

  @override
  Future<bool> deleteTerminal(String terminalId) async {
    return await _apiService.delete('$_routeV1/terminalid/$terminalId', authToken: .jwt, baseUrlVersion: .v2);
  }
}
