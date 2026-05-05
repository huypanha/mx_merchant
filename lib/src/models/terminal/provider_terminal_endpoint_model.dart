class MxTerminalEndpointModel {
  final bool? enableJsonPassthru;
  final String? gatewayUrl;
  final String? password;
  final String? provider;
  final String? serverDateFormat;
  final String? username;

  MxTerminalEndpointModel({this.enableJsonPassthru, this.gatewayUrl, this.password, this.provider, this.serverDateFormat, this.username});

  factory MxTerminalEndpointModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalEndpointModel(
      enableJsonPassthru: bool.tryParse(json['enableJsonPassthru'].toString()),
      gatewayUrl: json['gatewayUrl'],
      password: json['password'],
      provider: json['provider'],
      serverDateFormat: json['serverDateFormat'],
      username: json['username'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'enableJsonPassthru': enableJsonPassthru,
      'gatewayUrl': gatewayUrl,
      'password': password,
      'provider': provider,
      'serverDateFormat': serverDateFormat,
      'username': username,
    };
  }
}
