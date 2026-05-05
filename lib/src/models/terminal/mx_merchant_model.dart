import 'package:mx_merchant/src/models/terminal/terminal_model.dart';

import 'merchant_model.dart';

class MxTerminalMxMerchantModel {
  /// Merchant
  final MxTerminalMerchantModel? merchant;

  /// Transaction
  final Map<String, dynamic>? transaction;

  /// Terminal device
  final MxTerminalModel? device;

  MxTerminalMxMerchantModel({this.merchant, this.transaction, this.device});

  factory MxTerminalMxMerchantModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalMxMerchantModel(
      merchant: json['merchant'] == null ? null : MxTerminalMerchantModel.fromJson(json['merchant']),
      transaction: json['transaction'] != null ? Map<String, dynamic>.from(json['transaction']) : null,
      device: json['device'] != null ? MxTerminalModel.fromJson(json['device']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {'merchant': merchant?.toJson(), 'transaction': transaction, 'device': device?.toJson()}..removeWhere((_, v) => v == null);
  }
}
