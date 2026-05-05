import 'package:mx_merchant/src/models/terminal/provider_terminal_config_model.dart';

class MxTerminalProviderTerminalModel {
  final int? activationCode;
  final String? sessionKeyExpiry;
  final String? secretKey;
  final String? status;
  final String? uuid;
  final int? id;
  final String? portfolio;
  final String? dateCreated;
  final String? dateModified;
  final MxTerminalConfigurationModel? configuration;
  final int? vendorKey;

  MxTerminalProviderTerminalModel({
    this.activationCode,
    this.sessionKeyExpiry,
    this.secretKey,
    this.status,
    this.uuid,
    this.id,
    this.portfolio,
    this.dateCreated,
    this.dateModified,
    this.configuration,
    this.vendorKey,
  });

  factory MxTerminalProviderTerminalModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalProviderTerminalModel(
      activationCode: int.tryParse(json['activationCode'].toString()),
      sessionKeyExpiry: json['sessionKeyExpiry'],
      secretKey: json['secretKey'],
      status: json['status'],
      uuid: json['uuid'],
      id: int.tryParse(json['id'].toString()),
      portfolio: json['portfolio'],
      dateCreated: json['dateCreated'],
      dateModified: json['dateModified'],
      configuration: json['configuration'] != null ? MxTerminalConfigurationModel.fromJson(Map<String, dynamic>.from(json['configuration'])) : null,
      vendorKey: int.tryParse(json['vendorKey'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activationCode': activationCode,
      'sessionKeyExpiry': sessionKeyExpiry,
      'secretKey': secretKey,
      'status': status,
      'uuid': uuid,
      'id': id,
      'portfolio': portfolio,
      'dateCreated': dateCreated,
      'dateModified': dateModified,
      'configuration': configuration?.toJson(),
      'vendorKey': vendorKey,
    };
  }
}
