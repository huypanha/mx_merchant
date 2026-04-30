class MxTerminalKeyModel {
  /// The "activationCode" will be found in the Dejavoo Denovo portal and labeled as "SPIn RegisterID"
  final String? activationCode;

  /// The "authKey" will be found in the Dejavoo Denovo portal and labeled as "SPIn AuthKey"
  final String? authKey;

  MxTerminalKeyModel({this.activationCode, this.authKey});

  Map<String, dynamic> toJson() {
    return {'activationCode': activationCode, 'authKey': authKey}..removeWhere((_, v) => v == null);
  }
}
