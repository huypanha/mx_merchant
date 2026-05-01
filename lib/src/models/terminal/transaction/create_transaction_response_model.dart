import 'priority_payment_systems_model.dart';
import 'provider_model.dart';

class MxTerminalCreateTransactionResponseModel {
  /// Message
  final String? message;

  /// Priority Payment Systems
  final MxTerminalTransactionPriorityPaymentSystemsModel? priorityPaymentSystems;

  /// Provider
  final MxTerminalTransactionProviderModel? provider;

  /// Status
  final String? status;

  MxTerminalCreateTransactionResponseModel({this.message, this.priorityPaymentSystems, this.provider, this.status});

  factory MxTerminalCreateTransactionResponseModel.fromJson(Map<String, dynamic> json) {
    return MxTerminalCreateTransactionResponseModel(
      message: json['message'],
      priorityPaymentSystems: json['prioritypaymentsystems'] == null
          ? null
          : MxTerminalTransactionPriorityPaymentSystemsModel.fromJson(json['prioritypaymentsystems']),
      provider: json['provider'] == null ? null : MxTerminalTransactionProviderModel.fromJson(json['provider']),
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'prioritypaymentsystems': priorityPaymentSystems?.toJson(), 'provider': provider?.toJson(), 'status': status}
      ..removeWhere((_, v) => v == null);
  }
}
