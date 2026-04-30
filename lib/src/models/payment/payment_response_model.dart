import 'package:collection/collection.dart';
import 'package:mx_merchant/src/models/card/card_response_model.dart';
import 'package:mx_merchant/src/models/customer/customer_response_model.dart';
import 'package:mx_merchant/src/models/payment/risk_model.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxPaymentResponseModel {
  final String? created;
  final String? paymentToken;
  final int id;
  final String? creatorName;
  final int merchantId;
  final String? batch;
  final int batchId;
  final String? tenderType;
  final String? currency;
  final String? amount;
  final MxCardResponseModel? cardAccount;
  final Map<String, dynamic>? posData;
  final bool authOnly;
  final String? authCode;
  final MxPaymentResponseStatus? status;
  final String? meta;
  final MxRiskModel? risk;
  final bool requireSignature;
  final MxCustomerResponseModel? customer;
  final String? settledAmount;
  final String? settledCurrency;
  final String? authMessage;
  final String? availableAuthAmount;
  final String? reference;
  final String? tax;
  final String? invoice;
  final String? clientReference;
  final String? replayId;
  final String? type;
  final int reviewIndicator;
  final String? source;

  const MxPaymentResponseModel({
    this.created,
    this.paymentToken,
    this.id = 0,
    this.creatorName,
    this.merchantId = 0,
    this.batch,
    this.batchId = 0,
    this.tenderType,
    this.currency,
    this.amount,
    this.cardAccount,
    this.posData,
    this.authOnly = true,
    this.authCode,
    this.status,
    this.meta,
    this.risk,
    this.requireSignature = true,
    this.customer,
    this.settledAmount,
    this.settledCurrency,
    this.authMessage,
    this.availableAuthAmount,
    this.reference,
    this.tax,
    this.invoice,
    this.clientReference,
    this.replayId,
    this.type,
    this.reviewIndicator = 0,
    this.source,
  });

  factory MxPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return MxPaymentResponseModel(
      created: json['created'],
      paymentToken: json['paymentToken'],
      id: int.tryParse(json['id'].toString()) ?? 0,
      creatorName: json['creatorName'],
      merchantId: int.tryParse(json['merchantId'].toString()) ?? 0,
      batch: json['batch'],
      batchId: int.tryParse(json['batchId'].toString()) ?? 0,
      tenderType: json['tenderType'],
      currency: json['currency'],
      amount: json['amount'],
      cardAccount: json['cardAccount'] == null ? null : MxCardResponseModel.fromJson(json['cardAccount']),
      posData: json['posData'] != null ? Map<String, dynamic>.from(json['posData']) : null,
      authOnly: bool.tryParse(json['authOnly'].toString()) ?? true,
      authCode: json['authCode'],
      status: json['status'] == null ? null : MxPaymentResponseStatus.values.firstWhereOrNull((e) => e.name == json['status']),
      meta: json['meta'],
      risk: json['risk'] == null ? null : MxRiskModel.fromJson(json['risk'] as Map<String, dynamic>),
      requireSignature: bool.tryParse(json['requireSignature'].toString()) ?? true,
      customer: json['customer'] == null ? null : MxCustomerResponseModel.fromJson(json['customer'] as Map<String, dynamic>),
      settledAmount: json['settledAmount'],
      settledCurrency: json['settledCurrency'],
      authMessage: json['authMessage'],
      availableAuthAmount: json['availableAuthAmount'],
      reference: json['reference'],
      tax: json['tax'],
      invoice: json['invoice'],
      clientReference: json['clientReference'],
      replayId: json['replayId'],
      type: json['type'],
      reviewIndicator: int.tryParse(json['merchantId'].toString()) ?? 0,
      source: json['source'],
    );
  }

  Map<String, dynamic> toJson() => {
    'created': created,
    'paymentToken': paymentToken,
    'id': id,
    'creatorName': creatorName,
    'merchantId': merchantId,
    'batch': batch,
    'batchId': batchId,
    'tenderType': tenderType,
    'currency': currency,
    'amount': amount,
    'cardAccount': cardAccount?.toJson(),
    'posData': posData,
    'authOnly': authOnly,
    'authCode': authCode,
    'status': status,
    'meta': meta,
    'risk': risk?.toJson(),
    'requireSignature': requireSignature,
    'customer': customer?.toJson(),
    'settledAmount': settledAmount,
    'settledCurrency': settledCurrency,
    'authMessage': authMessage,
    'availableAuthAmount': availableAuthAmount,
    'reference': reference,
    'tax': tax,
    'invoice': invoice,
    'clientReference': clientReference,
    'replayId': replayId,
    'type': type,
    'reviewIndicator': reviewIndicator,
    'source': source,
  }..removeWhere((_, value) => value == null);
}
