import 'get_payment_response_record_model.dart';

class MxGetPaymentResponseModel {
  final List<MxGetPaymentResponseRecordModel>? records;
  final int recordCount;

  MxGetPaymentResponseModel({this.records, this.recordCount = 0});

  factory MxGetPaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return MxGetPaymentResponseModel(
      records: json['records'] != null ? MxGetPaymentResponseRecordModel.fromJsonArray(json['records']) : null,
      recordCount: int.tryParse(json['recordCount'].toString()) ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {'records': records?.map((e) => e.toJson()).toList(), 'recordCount': recordCount};
  }
}
