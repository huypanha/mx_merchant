class MxTerminalTransactionMerchantModel {
  /// Device Payment Audit ID
  final String? devicePaymentAuditId;

  MxTerminalTransactionMerchantModel({this.devicePaymentAuditId});

  factory MxTerminalTransactionMerchantModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionMerchantModel(devicePaymentAuditId: json['devicePaymentAuditId']);
  }

  Map<String, dynamic> toJson() {
    return {'devicePaymentAuditId': devicePaymentAuditId}..removeWhere((_, v) => v == null);
  }
}
