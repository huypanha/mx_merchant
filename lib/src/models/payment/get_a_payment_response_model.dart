import 'package:mx_merchant/src/models/customer/customer_response_model.dart';
import 'package:mx_merchant/src/models/payment/get_payment_response_record_model.dart';

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
      paymentToken: json['paymentToken'] as String,
      batch: json['batch'] as String,
      batchId: json['batchId'] as int,
      requireSignature: json['requireSignature'] as bool,
      customer: json['customer'] as MxCustomerResponseModel,
      settledDate: json['settledDate'] as String,
      customerName: json['customerName'] as String,
      taxExempt: json['taxExempt'] as bool,
      created: json['created'],
      id: int.tryParse(json['id'].toString()) ?? 0,
      creatorName: json['creatorName'],
      merchantId: int.tryParse(json['merchantId'].toString()) ?? 0,
      tenderType: json['tenderType'],
      currency: json['currency'],
      amount: json['amount'],
      cardAccount: json['cardAccount'] == null ? null : MxCardResponseModel.fromJson(Map<String, dynamic>.from(json['cardAccount'])),
      authOnly: bool.tryParse(json['authOnly'].toString()) ?? true,
      authCode: json['authCode'],
      status: json['status'],
      risk: json['risk'] != null ? Map<String, dynamic>.from(json['risk']) : null,
      settledAmount: json['settledAmount'],
      settledCurrency: json['settledCurrency'],
      cardPresent: bool.tryParse(json['cardPresent'].toString()) ?? true,
      authMessage: json['authMessage'],
      availableAuthAmount: json['availableAuthAmount'],
      reference: json['reference'],
      tax: json['tax'],
      invoice: json['invoice'],
      customerCode: json['customerCode'],
      clientReference: json['clientReference'],
      type: json['type'],
      reviewIndicator: int.tryParse(json['reviewIndicator'].toString()) ?? 0,
      source: json['source'],
    );
  }
}
