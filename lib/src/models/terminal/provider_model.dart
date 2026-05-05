import 'package:mx_merchant/src/models/terminal/provider_terminal_model.dart';

import 'transaction/provider_transaction_model.dart';

class MxTerminalProviderModel {
  /// Key
  final String? key;

  /// Name
  final String? name;

  /// Transaction
  final MxTerminalProviderTransactionModel? transaction;

  /// Terminal
  final MxTerminalProviderTerminalModel? terminal;

  MxTerminalProviderModel({this.key, this.name, this.transaction, this.terminal});

  factory MxTerminalProviderModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalProviderModel(
      key: json['key'],
      name: json['name'],
      transaction: json['transaction'] == null ? null : MxTerminalProviderTransactionModel.fromJson(json['transaction']),
      terminal: json['terminal'] == null ? null : MxTerminalProviderTerminalModel.fromJson(json['terminal']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'name': name, 'transaction': transaction?.toJson(), 'terminal': terminal?.toJson()}..removeWhere((_, v) => v == null);
  }
}
