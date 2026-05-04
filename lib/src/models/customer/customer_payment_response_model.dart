import 'customer_payment_response_record_model.dart';

class MxCustomerPaymentResponseModel {
  final List<MxCustomerPaymentRecordModel>? records;
  final int recordCount;

  MxCustomerPaymentResponseModel({this.records, this.recordCount = 0});

  factory MxCustomerPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return MxCustomerPaymentResponseModel(
      records: json['records'] == null ? null : MxCustomerPaymentRecordModel.fromJsonArray(json['records']),
      recordCount: json['recordCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'records': records?.map((e) => e.toJson()).toList(), 'recordCount': recordCount}..removeWhere((_, v) => v == null);
  }
}
