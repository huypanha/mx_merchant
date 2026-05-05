import '../models/terminal/create_terminal_response_model.dart';
import '../models/terminal/terminal_model.dart';
import '../models/terminal/terminal_request_model.dart';
import 'terminal_transaction_service.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-overview
abstract class MxTerminalService {
  /// Manage terminal transactions
  MxTerminalTransactionService get transaction;

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-list-of-terminals
  Future<List<MxTerminalModel>> getListOfTerminals() async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here:
  /// 1. https://developer.mxmerchant.com/reference/create-terminal
  /// 2. https://developer.mxmerchant.com/reference/create-terminal-anywherecommerce
  /// 3. https://developer.mxmerchant.com/reference/create-terminal-dejavoo
  Future<MxCreateTerminalResponseModel> create(MxTerminalRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/delete-terminal
  /// * terminalId: The terminal ID to delete. The identification number from the MX Merchant system for the terminal/device.
  Future<bool> delete(String terminalId) async {
    throw UnimplementedError();
  }
}
