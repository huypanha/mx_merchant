import 'package:mx_merchant/src/models/terminal/transaction/create_transaction_response_model.dart';

import '../models/terminal/transaction/create_transaction_request_model.dart';
import '../models/terminal/transaction/update_transaction_request_model.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/transaction-2
abstract class MxTerminalTransactionService {
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-create
  Future<MxTerminalCreateTransactionResponseModel> create(MxTerminalCreateTransactionRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-update
  Future update(MxTerminalUpdateTransactionRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-get
  Future get(String replayId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-delete
  Future<bool> delete(String terminalId) async {
    throw UnimplementedError();
  }
}
