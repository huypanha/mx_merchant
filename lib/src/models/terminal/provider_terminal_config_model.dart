import 'package:mx_merchant/mx_merchant.dart';

class MxTerminalConfigurationModel {
  final bool? cloudSyncEnabled;
  final String? defaultCardReader;
  final String? enabledEntryModes;
  final String? enabledPaymentMethods;
  final String? defaultCurrency;
  final MxTerminalEndpointModel? endpoint;
  final String? terminalMode;
  final bool? tipEnabled;
  final bool? enableTip;
  final bool? enableCustomTip;
  final List<MxTerminalTipOptionModel>? tipOptions;

  MxTerminalConfigurationModel({
    this.cloudSyncEnabled,
    this.defaultCardReader,
    this.enabledEntryModes,
    this.enabledPaymentMethods,
    this.defaultCurrency,
    this.endpoint,
    this.terminalMode,
    this.tipEnabled,
    this.enableTip,
    this.enableCustomTip,
    this.tipOptions,
  });

  factory MxTerminalConfigurationModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalConfigurationModel(
      cloudSyncEnabled: bool.tryParse(json['cloudSyncEnabled'].toString()),
      defaultCardReader: json['defaultCardReader'],
      enabledEntryModes: json['enabledEntryModes'],
      enabledPaymentMethods: json['enabledPaymentMethods'],
      defaultCurrency: json['defaultCurrency'],
      endpoint: json['endpoint'] != null ? MxTerminalEndpointModel.fromJson(Map<String, dynamic>.from(json['endpoint'])) : null,
      terminalMode: json['terminalMode'],
      tipEnabled: bool.tryParse(json['tipEnabled'].toString()),
      enableTip: bool.tryParse(json['enableTip'].toString()),
      enableCustomTip: bool.tryParse(json['enableCustomTip'].toString()),
      tipOptions: json['tipOptions'] is List
          ? (json['tipOptions'] as List).map((e) => MxTerminalTipOptionModel.fromJson(Map<String, dynamic>.from(e))).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cloudSyncEnabled': cloudSyncEnabled,
      'defaultCardReader': defaultCardReader,
      'enabledEntryModes': enabledEntryModes,
      'enabledPaymentMethods': enabledPaymentMethods,
      'defaultCurrency': defaultCurrency,
      'endpoint': endpoint?.toJson(),
      'terminalMode': terminalMode,
      'tipEnabled': tipEnabled,
      'enableTip': enableTip,
      'enableCustomTip': enableCustomTip,
      'tipOptions': tipOptions?.map((e) => e.toJson()).toList(),
    };
  }
}
