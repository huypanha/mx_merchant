import 'package:collection/collection.dart';
import 'package:mx_merchant/src/models/customer/customer_response_model.dart';
import 'package:mx_merchant/src/models/payment/get_payment_response_record_model.dart';
import 'package:mx_merchant/src/models/payment/risk_model.dart';

import '../../utils/enums.dart';
import '../card/card_response_model.dart';

class MxGetAPaymentResponseModel extends MxGetPaymentResponseRecordModel {
  final String? paymentToken;
  final String? batch;
  final int batchId;
  final bool requireSignature;
  final MxCustomerResponseModel? customer;
  final String? settledDate;
  final String? customerName;
  final bool taxExempt;

  MxGetAPaymentResponseModel({
    super.created,
    super.id,
    super.creatorName,
    super.merchantId,
    super.tenderType,
    super.currency,
    super.amount,
    super.authOnly,
    super.authCode,
    super.status,
    super.risk,
    super.settledAmount,
    super.settledCurrency,
    super.cardPresent,
    super.authMessage,
    super.availableAuthAmount,
    super.reference,
    super.tax,
    super.invoice,
    super.customerCode,
    super.clientReference,
    super.type,
    super.reviewIndicator,
    super.source,
    super.cardAccount,
    this.paymentToken,
    this.batch,
    this.batchId = 0,
    this.requireSignature = true,
    this.customer,
    this.settledDate,
    this.customerName,
    this.taxExempt = true,
  });

  factory MxGetAPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return MxGetAPaymentResponseModel(
      paymentToken: json['paymentToken'],
      batch: json['batch'].toString(),
      batchId: int.tryParse(json['batchId'].toString()) ?? 0,
      requireSignature: bool.tryParse(json['requireSignature'].toString()) ?? true,
      customer: json['customer'] != null ? MxCustomerResponseModel.fromJson(Map<String, dynamic>.from(json['customer'])) : null,
      settledDate: json['settledDate'],
      customerName: json['customerName'],
      taxExempt: bool.tryParse(json['taxExempt'].toString()) ?? true,
      created: json['created'].toString(),
      id: int.tryParse(json['id'].toString()) ?? 0,
      creatorName: json['creatorName'],
      merchantId: int.tryParse(json['merchantId'].toString()) ?? 0,
      tenderType: json['tenderType'] != null ? MxPaymentTenderTypeEnum.values.firstWhereOrNull((e) => e.name == json['tenderType']) : null,
      currency: json['currency'],
      amount: json['amount'].toString(),
      cardAccount: json['cardAccount'] == null ? null : MxCardResponseModel.fromJson(Map<String, dynamic>.from(json['cardAccount'])),
      authOnly: bool.tryParse(json['authOnly'].toString()) ?? true,
      authCode: json['authCode'],
      status: json['status'] != null ? MxPaymentResponseStatusEnum.values.firstWhereOrNull((e) => e.name == json['status']) : null,
      risk: json['risk'] != null ? MxRiskModel.fromJson(json['risk']) : null,
      settledAmount: (json['settledAmount'] ?? '').toString(),
      settledCurrency: json['settledCurrency'],
      cardPresent: bool.tryParse(json['cardPresent'].toString()) ?? true,
      authMessage: json['authMessage'] ?? '',
      availableAuthAmount: (json['availableAuthAmount'] ?? '').toString(),
      reference: json['reference'],
      tax: json['tax'],
      invoice: json['invoice'],
      customerCode: json['customerCode'],
      clientReference: json['clientReference'],
      type: json['type'] != null ? MxPaymentTransactionTypeEnum.values.firstWhereOrNull((e) => e.name == json['type']) : null,
      reviewIndicator: int.tryParse(json['reviewIndicator'].toString()) ?? 0,
      source: json['source'] != null ? MxPaymentSourceEnum.values.firstWhereOrNull((e) => e.name == json['source']) : null,
    );
  }
}
