import 'provider_transaction_model.dart';

class MxTerminalTransactionProviderModel {
  /// Key
  final String? key;

  /// Name
  final String? name;

  /// Transaction
  final MxTerminalTransactionProviderTransactionModel? transaction;

  MxTerminalTransactionProviderModel({this.key, this.name, this.transaction});

  factory MxTerminalTransactionProviderModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionProviderModel(
      key: json['key'],
      name: json['name'],
      transaction: json['transaction'] == null ? null : MxTerminalTransactionProviderTransactionModel.fromJson(json['transaction']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'key': key, 'name': name, 'transaction': transaction?.toJson()}..removeWhere((_, v) => v == null);
  }
}
