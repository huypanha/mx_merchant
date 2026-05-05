import 'mx_merchant_model.dart';

class MxTerminalPriorityPaymentSystemModel {
  /// MX Merchant
  final MxTerminalMxMerchantModel? mxMerchant;

  MxTerminalPriorityPaymentSystemModel({this.mxMerchant});

  factory MxTerminalPriorityPaymentSystemModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalPriorityPaymentSystemModel(
      mxMerchant: json['mxmerchant'] == null ? null : MxTerminalMxMerchantModel.fromJson(json['mxmerchant']),
    );
  }

  Map<String, dynamic> toJson() {
    return {'mxmerchant': mxMerchant?.toJson()}..removeWhere((_, v) => v == null);
  }
}
