import 'package:mx_merchant/mx_merchant.dart';

import '../models/terminal/terminal_model.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-overview
abstract class MxTerminalService {
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/get-list-of-terminals
  Future<List<MxTerminalModel>> getListOfTerminals() async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here:
  /// 1. https://developer.mxmerchant.com/reference/create-terminal
  /// 2. https://developer.mxmerchant.com/reference/create-terminal-anywherecommerce
  /// 3. https://developer.mxmerchant.com/reference/create-terminal-dejavoo
  Future createTerminal(MxTerminalRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/delete-terminal
  /// * terminalId: The terminal ID to delete. The identification number from the MX Merchant system for the terminal/device.
  Future<bool> deleteTerminal(String terminalId) async {
    throw UnimplementedError();
  }
}
