class MxTerminalTransactionProviderTransactionModel {
  /// Terminal ID
  final String? terminalID;

  /// Status
  final String? status;

  /// Transaction Type
  final String? transactionType;

  /// Total Amount
  final String? totalAmount;

  /// Callback Url
  final String? callbackUrl;

  /// UUID
  final String? uuid;

  /// ID
  final String? id;

  /// Portfolio
  final String? portfolio;

  /// Date Created
  final String? dateCreated;

  /// Client Reference
  final String? clientReference;

  /// Currency
  final String? currency;

  /// Merchant ID
  final String? merchantId;

  /// Source
  final String? source;

  /// Replay ID
  final String? replayId;

  /// Message
  final String? message;

  MxTerminalTransactionProviderTransactionModel({
    this.terminalID,
    this.status,
    this.transactionType,
    this.totalAmount,
    this.callbackUrl,
    this.uuid,
    this.id,
    this.portfolio,
    this.dateCreated,
    this.clientReference,
    this.currency,
    this.merchantId,
    this.source,
    this.replayId,
    this.message,
  });

  factory MxTerminalTransactionProviderTransactionModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalTransactionProviderTransactionModel(
      terminalID: json['terminalID'],
      status: json['status'],
      transactionType: json['transactionType'],
      totalAmount: json['totalAmount'],
      callbackUrl: json['callbackUrl'],
      uuid: json['uuid'],
      id: json['id'],
      portfolio: json['portfolio'],
      dateCreated: json['dateCreated'],
      clientReference: json['clientReference'],
      currency: json['currency'],
      merchantId: json['merchantId'],
      source: json['source'],
      replayId: json['replayId'],
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'terminalID': terminalID,
      'status': status,
      'transactionType': transactionType,
      'totalAmount': totalAmount,
      'callbackUrl': callbackUrl,
      'uuid': uuid,
      'id': id,
      'portfolio': portfolio,
      'dateCreated': dateCreated,
      'clientReference': clientReference,
      'currency': currency,
      'merchantId': merchantId,
      'source': source,
      'replayId': replayId,
      'message': message,
    }..removeWhere((_, v) => v == null);
  }
}
