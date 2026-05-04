import 'get_customer_response_record_model.dart';

class MxGetCustomerResponseModel {
  final List<MxGetCustomerRecordModel>? records;
  final int recordCount;

  MxGetCustomerResponseModel({this.records, this.recordCount = 0});

  factory MxGetCustomerResponseModel.fromJson(Map<String, dynamic> json) {
    return MxGetCustomerResponseModel(
      records: json['records'] == null ? null : (json['records'] as List).map((e) => MxGetCustomerRecordModel.fromJson(e)).toList(),
      recordCount: json['recordCount'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'records': records?.map((e) => e.toJson()).toList(), 'recordCount': recordCount}..removeWhere((_, v) => v == null);
  }
}
