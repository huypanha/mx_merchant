import '../../utils/enums.dart';

class MxGetCustomerRequestModel {
  /// Number of records to return
  final int limit;

  /// Sort ascending or descending
  final bool ascending;

  /// Search fields; can search on name, customer number, email, city, state, or zip
  final String? filter;

  /// Search customers by spend profile
  final String? spendProfile;

  /// Field to sort by
  final String sortField;

  /// Filter results to time customer was last active.
  final MxDurationOptionEnum lastActivity;

  /// Start date for time filter
  final String? startDate;

  /// End date for time filter
  final String? endDate;

  MxGetCustomerRequestModel({
    this.limit = 0,
    this.ascending = false,
    this.filter,
    this.spendProfile,
    this.sortField = 'lastActivity',
    this.lastActivity = .lifetime,
    this.startDate,
    this.endDate,
  }) : assert(limit >= 0, 'Limit must be greater than or equal to 0'),
       assert(lastActivity == .custom && startDate != null && endDate != null, 'Custom time filter must have start and end dates');

  Map<String, dynamic> toJson() {
    return {
      'limit': limit,
      'ascending': ascending,
      'filter': filter,
      'spendProfile': spendProfile,
      'sortField': sortField,
      'lastActivity': lastActivity.name,
      'startDate': startDate,
      'endDate': endDate,
    }..removeWhere((_, v) => v == null);
  }
}
