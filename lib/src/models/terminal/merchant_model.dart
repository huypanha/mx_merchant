class MxTerminalMerchantModel {
  /// Device Payment Audit ID
  final String? devicePaymentAuditId;

  MxTerminalMerchantModel({this.devicePaymentAuditId});

  factory MxTerminalMerchantModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalMerchantModel(devicePaymentAuditId: json['devicePaymentAuditId']);
  }

  Map<String, dynamic> toJson() {
    return {'devicePaymentAuditId': devicePaymentAuditId}..removeWhere((_, v) => v == null);
  }
}
