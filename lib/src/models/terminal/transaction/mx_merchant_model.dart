import 'package:mx_merchant/src/models/terminal/terminal_model.dart';

import 'merchant_model.dart';

class MxTerminalTransactionMxMerchantModel {
  /// Merchant
  final MxTerminalTransactionMerchantModel? merchant;

  /// Transaction
  final Map<String, dynamic>? transaction;

  final MxTerminalModel? device;

  MxTerminalTransactionMxMerchantModel({this.merchant, this.transaction, this.device});

  factory MxTerminalTransactionMxMerchantModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionMxMerchantModel(
      merchant: json['merchant'] == null ? null : MxTerminalTransactionMerchantModel.fromJson(json['merchant']),
      transaction: json['transaction'] != null ? Map<String, dynamic>.from(json['transaction']) : null,
      device: json['device'] != null ? MxTerminalModel.fromJson(json['device']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'merchant': merchant?.toJson(), 'transaction': transaction, 'device': device?.toJson()}..removeWhere((_, v) => v == null);
  }
}
