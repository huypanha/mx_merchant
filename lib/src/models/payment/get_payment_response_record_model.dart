import 'package:collection/collection.dart';
import 'package:mx_merchant/mx_merchant.dart';

class MxGetPaymentResponseRecordModel {
  final String? created;
  final int id;
  final String? creatorName;
  final int merchantId;
  final MxPaymentTenderType? tenderType;
  final String? currency;
  final String? amount;
  final MxCardResponseModel? cardAccount;
  final bool authOnly;
  final String? authCode;
  final MxPaymentResponseStatus? status;
  final MxRiskModel? risk;
  final String? settledAmount;
  final String? settledCurrency;
  final bool cardPresent;
  final String? authMessage;
  final String? availableAuthAmount;
  final String? reference;
  final String? tax;
  final String? invoice;
  final String? customerCode;
  final String? clientReference;
  final MxPaymentTransactionType? type;
  final int reviewIndicator;
  final MxPaymentSource? source;

  MxGetPaymentResponseRecordModel({
    this.created,
    this.id = 0,
    this.creatorName,
    this.merchantId = 0,
    this.tenderType,
    this.currency,
    this.amount,
    this.cardAccount,
    this.authOnly = true,
    this.authCode,
    this.status,
    this.risk,
    this.settledAmount,
    this.settledCurrency,
    this.cardPresent = true,
    this.authMessage,
    this.availableAuthAmount,
    this.reference,
    this.tax,
    this.invoice,
    this.customerCode,
    this.clientReference,
    this.type,
    this.reviewIndicator = 0,
    this.source,
  });

  factory MxGetPaymentResponseRecordModel.fromJson(Map<String, dynamic> json) {
    return MxGetPaymentResponseRecordModel(
      created: json['created'],
      id: int.tryParse(json['id'].toString()) ?? 0,
      creatorName: json['creatorName'],
      merchantId: int.tryParse(json['merchantId'].toString()) ?? 0,
      tenderType: json['tenderType'] != null ? MxPaymentTenderType.values.firstWhereOrNull((e) => e.name == json['tenderType']) : null,
      currency: json['currency'],
      amount: json['amount'].toString(),
      cardAccount: json['cardAccount'] == null ? null : MxCardResponseModel.fromJson(Map<String, dynamic>.from(json['cardAccount'])),
      authOnly: bool.tryParse(json['authOnly'].toString()) ?? true,
      authCode: json['authCode'],
      status: json['status'] != null ? MxPaymentResponseStatus.values.firstWhereOrNull((e) => e.name == json['status']) : null,
      risk: json['risk'] != null ? MxRiskModel.fromJson(json['risk']) : null,
      settledAmount: (json['settledAmount'] ?? '').toString(),
      settledCurrency: json['settledCurrency'],
      cardPresent: bool.tryParse(json['cardPresent'].toString()) ?? true,
      authMessage: json['authMessage'],
      availableAuthAmount: json['availableAuthAmount'],
      reference: json['reference'],
      tax: json['tax'],
      invoice: json['invoice'],
      customerCode: json['customerCode'],
      clientReference: json['clientReference'],
      type: json['type'] != null ? MxPaymentTransactionType.values.firstWhereOrNull((e) => e.name == json['type']) : null,
      reviewIndicator: int.tryParse(json['reviewIndicator'].toString()) ?? 0,
      source: json['source'] != null ? MxPaymentSource.values.firstWhereOrNull((e) => e.name == json['source']) : null,
    );
  }

  static List<MxGetPaymentResponseRecordModel> fromJsonArray(List data) => data.map((e) => MxGetPaymentResponseRecordModel.fromJson(e)).toList();

  Map<String, dynamic> toJson() {
    return {
      'created': created,
      'id': id,
      'creatorName': creatorName,
      'merchantId': merchantId,
      'tenderType': tenderType?.name,
      'currency': currency,
      'amount': amount,
      'cardAccount': cardAccount?.toJson(),
      'authOnly': authOnly,
      'authCode': authCode,
      'status': status?.name,
      'risk': risk?.toJson(),
      'settledAmount': settledAmount,
      'settledCurrency': settledCurrency,
      'cardPresent': cardPresent,
      'authMessage': authMessage,
      'availableAuthAmount': availableAuthAmount,
      'reference': reference,
      'tax': tax,
      'invoice': invoice,
      'customerCode': customerCode,
      'clientReference': clientReference,
      'type': type?.name,
      'reviewIndicator': reviewIndicator,
      'source': source?.name,
    };
  }
}
