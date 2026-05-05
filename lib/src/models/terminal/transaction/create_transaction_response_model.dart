import '../priority_payment_systems_model.dart';
import '../provider_model.dart';

class MxTerminalCreateTransactionResponseModel {
  /// Message
  final String? message;

  /// Priority Payment Systems
  final MxTerminalPriorityPaymentSystemModel? priorityPaymentSystems;

  /// Provider
  final MxTerminalProviderModel? provider;

  /// Status
  final String? status;

  MxTerminalCreateTransactionResponseModel({this.message, this.priorityPaymentSystems, this.provider, this.status});

  factory MxTerminalCreateTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalCreateTransactionResponseModel(
      message: json['message'],
      priorityPaymentSystems: json['prioritypaymentsystems'] == null
          ? null
          : MxTerminalPriorityPaymentSystemModel.fromJson(json['prioritypaymentsystems']),
      provider: json['provider'] == null ? null : MxTerminalProviderModel.fromJson(json['provider']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'prioritypaymentsystems': priorityPaymentSystems?.toJson(), 'provider': provider?.toJson(), 'status': status}
      ..removeWhere((_, v) => v == null);
  }
}
