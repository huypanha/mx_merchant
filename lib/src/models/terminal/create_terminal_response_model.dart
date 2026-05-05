import 'package:mx_merchant/mx_merchant.dart';

import 'priority_payment_systems_model.dart';

class MxCreateTerminalResponseModel {
  final String? id;
  final String? name;
  final String? description;
  final bool? enabled;
  final MxTerminalEntryModeModel? entryModes;
  final String? defaultModel;
  final MxTerminalPaymentMethodModel? paymentMethods;
  final MxTerminalTipModel? tip;
  final MxTerminalPriorityPaymentSystemModel? priorityPaymentSystems;
  final MxTerminalProviderModel? provider;

  MxCreateTerminalResponseModel({
    this.id,
    this.name,
    this.description,
    this.enabled,
    this.entryModes,
    this.defaultModel,
    this.paymentMethods,
    this.tip,
    this.priorityPaymentSystems,
    this.provider,
  });

  factory MxCreateTerminalResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCreateTerminalResponseModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      enabled: bool.tryParse(json['enabled'].toString()),
      entryModes: json['entryModes'] != null ? MxTerminalEntryModeModel.fromJson(Map<String, dynamic>.from(json['entryModes'])) : null,
      defaultModel: json['defaultModel'],
      paymentMethods: json['paymentMethods'] != null
          ? MxTerminalPaymentMethodModel.fromJson(Map<String, dynamic>.from(json['paymentMethods']))
          : null,
      tip: json['tip'] != null ? MxTerminalTipModel.fromJson(Map<String, dynamic>.from(json['tip'])) : null,
      priorityPaymentSystems: json['priorityPaymentSystems'] != null
          ? MxTerminalPriorityPaymentSystemModel.fromJson(Map<String, dynamic>.from(json['priorityPaymentSystems']))
          : null,
      provider: json['provider'] != null ? MxTerminalProviderModel.fromJson(Map<String, dynamic>.from(json['provider'])) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'enabled': enabled,
      'entryModes': entryModes?.toJson(),
      'defaultModel': defaultModel,
      'paymentMethods': paymentMethods?.toJson(),
      'tip': tip?.toJson(),
      'priorityPaymentSystems': priorityPaymentSystems?.toJson(),
      'provider': provider?.toJson(),
    };
  }
}
