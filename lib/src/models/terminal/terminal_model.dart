import 'dart:convert';

class MxTerminalModel {
  final String? id;
  final int? iid;
  final String? name;
  final String? description;
  final String? deviceType;
  final String? deviceTypeName;
  final int? merchantId;
  final String? uniqueIdentifier;
  final bool? enabled;
  final bool? isVirtual;
  final bool deleted;
  final String? onSuccessUrl;
  final String? onFailureUrl;
  final Map<String, dynamic>? properties;
  final String? dBA;
  final String? providerKey;
  final String? externalSource;
  final String? externalId;
  final String? minPaymentAmount;
  final String? maxPaymentAmount;
  final int? recordCount;

  MxTerminalModel({
    this.id,
    this.iid,
    this.name,
    this.description,
    this.deviceType,
    this.deviceTypeName,
    this.merchantId,
    this.uniqueIdentifier,
    this.enabled,
    this.isVirtual,
    this.deleted = false,
    this.onSuccessUrl,
    this.onFailureUrl,
    this.properties,
    this.dBA,
    this.providerKey,
    this.externalSource,
    this.externalId,
    this.minPaymentAmount,
    this.maxPaymentAmount,
    this.recordCount,
  });

  factory MxTerminalModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalModel(
      id: json['id'],
      iid: int.tryParse(json['iid'].toString()),
      name: json['name'],
      description: json['description'],
      deviceType: json['deviceType'],
      deviceTypeName: json['deviceTypeName'],
      merchantId: int.tryParse(json['merchantId'].toString()) ?? 0,
      uniqueIdentifier: json['uniqueIdentifier'],
      enabled: bool.tryParse(json['enabled'].toString()) ?? true,
      isVirtual: bool.tryParse(json['isVirtual'].toString()) ?? false,
      deleted: bool.tryParse(json['deleted'].toString()) ?? false,
      onSuccessUrl: json['onSuccessUrl'],
      onFailureUrl: json['onFailureUrl'],
      properties: json['properties'] != null ? Map<String, dynamic>.from(jsonDecode(json['properties'])) : null,
      dBA: json['dBA'],
      providerKey: json['providerKey'],
      externalSource: json['externalSource'],
      externalId: json['externalId'],
      minPaymentAmount: (json['minPaymentAmount'] ?? '').toString(),
      maxPaymentAmount: (json['maxPaymentAmount'] ?? '').toString(),
      recordCount: int.tryParse(json['recordCount'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'iid': iid,
      'name': name,
      'description': description,
      'deviceType': deviceType,
      'deviceTypeName': deviceTypeName,
      'merchantId': merchantId,
      'uniqueIdentifier': uniqueIdentifier,
      'enabled': enabled,
      'isVirtual': isVirtual,
      'deleted': deleted,
      'onSuccessUrl': onSuccessUrl,
      'onFailureUrl': onFailureUrl,
      'properties': properties,
      'dBA': dBA,
      'providerKey': providerKey,
      'externalSource': externalSource,
      'externalId': externalId,
      'minPaymentAmount': minPaymentAmount,
      'maxPaymentAmount': maxPaymentAmount,
      'recordCount': recordCount,
    };
  }

  static List<MxTerminalModel> fromJsonArray(List data) => data.map((e) => MxTerminalModel.fromJson(e)).toList();
}
