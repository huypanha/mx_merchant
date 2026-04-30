class MxRiskModel {
  final String? cvvResponseCode;
  final String? cvvResponse;
  final bool cvvMatch;
  final String? avsResponseCode;
  final bool avsAddressMatch;
  final bool avsZipMatch;

  const MxRiskModel({
    this.cvvResponseCode,
    this.cvvResponse,
    this.cvvMatch = true,
    this.avsResponseCode,
    this.avsAddressMatch = true,
    this.avsZipMatch = true,
  });

  factory MxRiskModel.fromJson(Map<String, dynamic> json) {
    return MxRiskModel(
      cvvResponseCode: json['cvvResponseCode'],
      cvvResponse: json['cvvResponse'],
      cvvMatch: bool.tryParse(json['cvvMatch'].toString()) ?? true,
      avsResponseCode: json['avsResponseCode'],
      avsAddressMatch: bool.tryParse(json['avsAddressMatch'].toString()) ?? true,
      avsZipMatch: bool.tryParse(json['avsZipMatch'].toString()) ?? true,
    );
  }

  Map<String, dynamic> toJson() => {
    'cvvResponseCode': cvvResponseCode,
    'cvvResponse': cvvResponse,
    'cvvMatch': cvvMatch,
    'avsResponseCode': avsResponseCode,
    'avsAddressMatch': avsAddressMatch,
    'avsZipMatch': avsZipMatch,
  }..removeWhere((_, value) => value == null);
}
