import 'merchant_model.dart';

class MxTerminalTransactionMxMerchantModel {
  /// Merchant
  final MxTerminalTransactionMerchantModel? merchant;

  /// Transaction
  final Map<String, dynamic>? transaction;

  MxTerminalTransactionMxMerchantModel({this.merchant, this.transaction});

  factory MxTerminalTransactionMxMerchantModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionMxMerchantModel(
      merchant: json['merchant'] == null ? null : MxTerminalTransactionMerchantModel.fromJson(json['merchant']),
      transaction: json['transaction'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'merchant': merchant?.toJson(), 'transaction': transaction}..removeWhere((_, v) => v == null);
  }
}
