import 'package:mx_merchant/src/models/terminal/transaction/create_transaction_response_model.dart';

import '../models/terminal/transaction/create_transaction_request_model.dart';
import '../models/terminal/transaction/update_transaction_request_model.dart';

/// The full documentation can be found here: https://developer.mxmerchant.com/reference/transaction-2
abstract class MxTerminalTransactionService {
  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-create
  Future<MxTerminalCreateTransactionResponseModel> createTransaction(MxTerminalCreateTransactionRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-update
  Future updateTransaction(MxTerminalUpdateTransactionRequestModel request) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-get
  Future getTransaction(String replayId) async {
    throw UnimplementedError();
  }

  /// The full documentation can be found here: https://developer.mxmerchant.com/reference/terminal-transaction-delete
  Future<bool> deleteTransaction(String terminalId) async {
    throw UnimplementedError();
  }
}
