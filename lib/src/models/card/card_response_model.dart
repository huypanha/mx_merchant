class MxCardResponseModel {
  final String? cardType;
  final String? entryMode;
  final String? last4;
  final String? cardId;
  final String? token;
  final String? expiryMonth;
  final String? expiryYear;
  final bool hasContract;
  final bool cardPresent;

  const MxCardResponseModel({
    this.cardType,
    this.entryMode,
    this.last4,
    this.cardId,
    this.token,
    this.expiryMonth,
    this.expiryYear,
    this.hasContract = false,
    this.cardPresent = true,
  });

  factory MxCardResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCardResponseModel(
      cardType: json['cardType'],
      entryMode: json['entryMode'],
      last4: json['last4'],
      cardId: json['cardId'],
      token: json['token'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      hasContract: bool.tryParse(json['hasContract'].toString()) ?? false,
      cardPresent: bool.tryParse(json['cardPresent'].toString()) ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'cardType': cardType,
    'entryMode': entryMode,
    'last4': last4,
    'cardId': cardId,
    'token': token,
    'expiryMonth': expiryMonth,
    'expiryYear': expiryYear,
    'hasContract': hasContract,
    'cardPresent': cardPresent,
  }..removeWhere((_, value) => value == null);
}
