import 'transaction/mx_merchant_model.dart';

class MxTerminalPriorityPaymentSystemModel {
  /// MX Merchant
  final MxTerminalTransactionMxMerchantModel? mxMerchant;

  MxTerminalPriorityPaymentSystemModel({this.mxMerchant});

  factory MxTerminalPriorityPaymentSystemModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalPriorityPaymentSystemModel(
      mxMerchant: json['mxmerchant'] == null ? null : MxTerminalTransactionMxMerchantModel.fromJson(json['mxmerchant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'mxmerchant': mxMerchant?.toJson()}..removeWhere((_, v) => v == null);
  }
}
