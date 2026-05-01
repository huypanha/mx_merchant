import 'mx_merchant_model.dart';

class MxTerminalTransactionPriorityPaymentSystemsModel {
  /// MX Merchant
  final MxTerminalTransactionMxMerchantModel? mxMerchant;

  MxTerminalTransactionPriorityPaymentSystemsModel({this.mxMerchant});

  factory MxTerminalTransactionPriorityPaymentSystemsModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionPriorityPaymentSystemsModel(
      mxMerchant: json['mxmerchant'] == null ? null : MxTerminalTransactionMxMerchantModel.fromJson(json['mxmerchant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'mxmerchant': mxMerchant?.toJson()}..removeWhere((_, v) => v == null);
  }
}
