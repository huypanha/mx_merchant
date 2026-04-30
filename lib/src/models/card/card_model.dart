class MxCardModel {
  /// Card Number
  final String? number;

  /// Card Expiration Month
  final String? expiryMonth;

  /// Card Expiration Year
  final String? expiryYear;

  /// Vaulted Payment Token
  final String? token;

  /// Billing Street Address.
  /// Required if Loss Prevention Setting is turned on.
  final String? avsStreet;

  /// Billing Postal Code.
  /// Required if Loss Prevention Setting is turned on.
  final String? avsZip;

  /// 3 or 4 digit card verification value.
  /// Required if Loss Prevention Setting is turned on.
  final String? cvv;

  /// Magnetic Stripe Data
  final String? magstripe;

  /// Client provided, easy to remember name for the card.
  final String? alias;

  /// Byte array converted to string - ICC, chip data for EMV transactions.
  final String? emvData;

  /// KSN for encrypted EMV data.
  final String? emvDataKsn;

  /// Track 1 data - base64 encrypted value or plaintext.
  final String? track1;

  /// Track 2 data - base64 encrypted value or plaintext.
  final String? track2;

  /// KSN for encrypted track 1 data.
  final String? track1Ksn;

  /// KSN for encrypted track 2 data.
  final String? track2Ksn;

  const MxCardModel({
    this.number,
    this.expiryMonth,
    this.expiryYear,
    this.token,
    this.avsStreet,
    this.avsZip,
    this.cvv,
    this.magstripe,
    this.alias,
    this.emvData,
    this.emvDataKsn,
    this.track1,
    this.track2,
    this.track1Ksn,
    this.track2Ksn,
  });

  Map<String, dynamic> toJson() => {
    'number': number,
    'expiryMonth': expiryMonth,
    'expiryYear': expiryYear,
    'token': token,
    'avsStreet': avsStreet,
    'avsZip': avsZip,
    'cvv': cvv,
    'magstripe': magstripe,
    'alias': alias,
    'emvData': emvData,
    'emvDataKsn': emvDataKsn,
    'track1': track1,
    'track2': track2,
    'track1Ksn': track1Ksn,
    'track2Ksn': track2Ksn,
  }..removeWhere((_, value) => value == null);

  factory MxCardModel.fromJson(Map<String, dynamic> json) {
    return MxCardModel(
      number: json['number'],
      expiryMonth: json['expiryMonth'],
      expiryYear: json['expiryYear'],
      token: json['token'],
      avsStreet: json['avsStreet'],
      avsZip: json['avsZip'],
      cvv: json['cvv'],
      magstripe: json['magstripe'],
      alias: json['alias'],
      emvData: json['emvData'],
      emvDataKsn: json['emvDataKsn'],
      track1: json['track1'],
      track2: json['track2'],
      track1Ksn: json['track1Ksn'],
      track2Ksn: json['track2Ksn'],
    );
  }
}
