import '../../utils/enums.dart';

class MxGetPaymentRequestModel {
  final MxPaymentTransactionType transactionType;
  final MxPaymentTenderType tenderType;
  final MxPaymentResponseStatus status;
  final MxFilterDateType dateType;
  final MxPaymentSource source;

  /// YYYY-MM-DDThh:mm:ssZ (Required for Custom `dateType`)
  final String? startDate;

  /// YYYY-MM-DDThh:mm:ssZ (Required for Custom `dateType`)
  final String? endDate;

  /// Number of records to return
  final int limit;

  /// Specific paymentId to return a single payment
  final int? id;

  /// Returns the customer object associated with the payment
  final bool includeCustomer;

  /// Checks if the card is a business card. Only used when B2B is enabled.
  final bool? shouldGetCreditCardLevel;

  /// Search payments by Reference, Auth Code, PO, Customer
  final String? filter;

  MxGetPaymentRequestModel({
    this.transactionType = .any,
    this.tenderType = .any,
    this.status = .any,
    this.dateType = .last30,
    this.startDate,
    this.endDate,
    this.source = .any,
    this.limit = 50,
    this.id,
    this.includeCustomer = true,
    this.shouldGetCreditCardLevel,
    this.filter,
  }) : assert(dateType != .custom || (startDate != null && endDate != null), 'startDate and endDate are required when dateType is Custom'),
       assert(limit > 0, 'limit must be greater than 0');

  Map<String, dynamic> toJson() {
    return {
      'transactionType': transactionType.name,
      'tenderType': tenderType.name,
      'status': status.name,
      'dateType': dateType.name,
      'startDate': startDate,
      'endDate': endDate,
      'source': source.name,
      'limit': limit,
      'id': id,
      'includeCustomer': includeCustomer,
      'ShouldGetCreditCardLevel': shouldGetCreditCardLevel,
      'filter': filter,
    }..removeWhere((_, v) => v == null);
  }
}
