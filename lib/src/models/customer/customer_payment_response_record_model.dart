import 'package:mx_merchant/mx_merchant.dart';

class MxCustomerPaymentRecordModel {
  final String? created;
  final String? paymentToken;
  final int id;
  final String? creatorName;
  final int merchantId;
  final String? batch;
  final int batchId;
  final String? tenderType;
  final String? last4;
  final String? amount;
  final bool authOnly;
  final String? status;
  final MxRiskModel? risk;
  final bool requireSignature;
  final String? settledAmount;
  final String? settledDate;
  final String? authMessage;
  final String? availableAuthAmount;
  final String? reference;
  final String? tax;
  final String? invoice;
  final String? customerCode;
  final String? customerName;
  final String? clientReference;
  final String? type;
  final String? source;

  MxCustomerPaymentRecordModel({
    this.created,
    this.paymentToken,
    this.id = 0,
    this.creatorName,
    this.merchantId = 0,
    this.batch,
    this.batchId = 0,
    this.tenderType,
    this.last4,
    this.amount,
    this.authOnly = true,
    this.status,
    this.risk,
    this.requireSignature = true,
    this.settledAmount,
    this.settledDate,
    this.authMessage,
    this.availableAuthAmount,
    this.reference,
    this.tax,
    this.invoice,
    this.customerCode,
    this.customerName,
    this.clientReference,
    this.type,
    this.source,
  });

  factory MxCustomerPaymentRecordModel.fromJson(Map<String, dynamic> json) {
    return MxCustomerPaymentRecordModel(
      created: json['created'],
      paymentToken: json['paymentToken'],
      id: json['id'] ?? 0,
      creatorName: json['creatorName'],
      merchantId: json['merchantId'] ?? 0,
      batch: json['batch'],
      batchId: json['batchId'] ?? 0,
      tenderType: json['tenderType'],
      last4: json['last4'],
      amount: json['amount'],
      authOnly: json['authOnly'] ?? true,
      status: json['status'],
      risk: json['risk'] != null ? MxRiskModel.fromJson(json['risk']) : null,
      requireSignature: json['requireSignature'] ?? true,
      settledAmount: json['settledAmount'],
      settledDate: json['settledDate'],
      authMessage: json['authMessage'],
      availableAuthAmount: json['availableAuthAmount'],
      reference: json['reference'],
      tax: json['tax'],
      invoice: json['invoice'],
      customerCode: json['customerCode'],
      customerName: json['customerName'],
      clientReference: json['clientReference'],
      type: json['type'],
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'created': created,
      'paymentToken': paymentToken,
      'id': id,
      'creatorName': creatorName,
      'merchantId': merchantId,
      'batch': batch,
      'batchId': batchId,
      'tenderType': tenderType,
      'last4': last4,
      'amount': amount,
      'authOnly': authOnly,
      'status': status,
      'risk': risk?.toJson(),
      'requireSignature': requireSignature,
      'settledAmount': settledAmount,
      'settledDate': settledDate,
      'authMessage': authMessage,
      'availableAuthAmount': availableAuthAmount,
      'reference': reference,
      'tax': tax,
      'invoice': invoice,
      'customerCode': customerCode,
      'customerName': customerName,
      'clientReference': clientReference,
      'type': type,
      'source': source,
    }..removeWhere((_, v) => v == null);
  }

  static List<MxCustomerPaymentRecordModel> fromJsonArray(List array) => array.map((e) => MxCustomerPaymentRecordModel.fromJson(e)).toList();
}
