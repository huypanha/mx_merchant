import 'package:collection/collection.dart';
import 'package:mx_merchant/src/utils/enums.dart';

class MxCustomerModel {
  /// Customer to associate the payment with
  final String? id;

  /// Customer Name. Creates customer.
  final String? name;

  /// Customer First Name. Creates customer.
  final String? firstName;

  /// Customer Last Name. Creates customer.
  final String? lastName;

  final MxCustomerType? type;

  const MxCustomerModel({this.id, this.name, this.firstName, this.lastName, this.type});

  Map<String, dynamic> toJson() =>
      {'id': id, 'name': name, 'firstName': firstName, 'lastName': lastName, 'type': type?.name}..removeWhere((_, value) => value == null);

  factory MxCustomerModel.fromJson(Map<String, dynamic> json) {
    return MxCustomerModel(
      id: json['id'],
      name: json['name'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      type: json['type'] != null ? MxCustomerType.values.firstWhereOrNull((e) => e.name == json['type']) : null,
    );
  }
}
