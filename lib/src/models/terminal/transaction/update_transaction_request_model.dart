class MxTerminalUpdateTransactionRequestModel {
  /// Reference
  final String reference;

  /// Terminal ID.
  final String terminalId;

  /// Transaction ID.
  final String transactionId;

  MxTerminalUpdateTransactionRequestModel({required this.reference, required this.terminalId, required this.transactionId});

  Map<String, dynamic> toJson() {
    return {'reference': reference, 'terminalId': terminalId, 'transactionId': transactionId};
  }
}
